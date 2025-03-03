#!/bin/bash
# Wazuh Server Setup Script for CyberLabSetup
# This script automates the setup of Wazuh Server on Ubuntu

# Exit on error
set -e

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

# Update system
echo "[+] Updating system packages..."
apt update && apt upgrade -y

# Install required packages
echo "[+] Installing required packages..."
apt-get install curl apt-transport-https unzip wget libcap2-bin software-properties-common lsb-release gnupg2 -y

# Install Wazuh repository
echo "[+] Adding Wazuh repository..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import
chmod 644 /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update

# Install Wazuh Manager
echo "[+] Installing Wazuh Manager..."
apt-get install wazuh-manager -y
systemctl daemon-reload
systemctl enable wazuh-manager
systemctl start wazuh-manager

# Install Elasticsearch
echo "[+] Installing Elasticsearch..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
apt-get update
apt-get install elasticsearch=7.17.9 -y

# Configure Elasticsearch
echo "[+] Configuring Elasticsearch..."
cat > /etc/elasticsearch/elasticsearch.yml << EOL
node.name: node-1
network.host: 127.0.0.1
http.port: 9200
cluster.initial_master_nodes: ["node-1"]
EOL

# Start Elasticsearch
echo "[+] Starting Elasticsearch..."
systemctl daemon-reload
systemctl enable elasticsearch
systemctl start elasticsearch

# Install Filebeat
echo "[+] Installing Filebeat..."
apt-get install filebeat=7.17.9 -y
curl -so /etc/filebeat/filebeat.yml https://packages.wazuh.com/resources/4.3/open-distro/filebeat/7.x/filebeat.yml
filebeat setup
systemctl enable filebeat
systemctl start filebeat

# Install Kibana
echo "[+] Installing Kibana..."
apt-get install kibana=7.17.9 -y

# Install Wazuh Kibana plugin
echo "[+] Installing Wazuh Kibana plugin..."
cd /usr/share/kibana/
bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.3.10_7.17.9-1.zip
systemctl enable kibana
systemctl start kibana

# Set up Nginx (optional for remote access)
echo "[+] Setting up Nginx for dashboard access..."
apt-get install nginx -y
cat > /etc/nginx/sites-available/wazuh << EOL
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://localhost:5601;
    }
}
EOL
ln -s /etc/nginx/sites-available/wazuh /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx

# Configure network
echo "[+] Setting up static IP..."
cat > /etc/netplan/00-installer-config.yaml << EOL
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      addresses: [192.168.176.20/24]
      gateway4: 192.168.176.2
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOL
netplan apply

echo "[+] Wazuh setup complete!"
echo "Access the Wazuh dashboard at: http://$(hostname -I | awk '{print $1}')"
echo "Default credentials: admin/admin"
echo "You will be prompted to change the password on first login" 
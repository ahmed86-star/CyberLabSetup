# Setting Up Ubuntu Server with Wazuh

This guide walks you through installing and configuring Ubuntu Server with Wazuh for security monitoring.

## Prerequisites
- VMware Workstation Pro installed
- Ubuntu Server ISO downloaded
- At least 20GB of free disk space
- 4GB+ RAM allocated to the VM

## Installation Steps

1. **Create a New Virtual Machine**
   - Launch VMware Workstation Pro
   - Click "Create a New Virtual Machine"
   - Select "Typical (recommended)" and click "Next"
   - Select "Installer disc image file (iso)" and browse to your Ubuntu Server ISO
   - Click "Next"

2. **Configure VM Settings**
   - Enter name: "Ubuntu-Wazuh"
   - Set location for VM files
   - Click "Next"
   - Set disk size (minimum 20GB recommended)
   - Click "Next"
   - Click "Customize Hardware"
   - Allocate at least 4GB RAM
   - Allocate 2+ processor cores if available
   - Click "Close" and then "Finish"

3. **Install Ubuntu Server**
   - Start the VM
   - Follow the installation wizard
   - Select your language, location, and keyboard layout
   - Set up network connections
   - Configure storage (use guided partitioning for simplicity)
   - Create a user account
   - Select OpenSSH server during software selection
   - Complete the installation and reboot

4. **Update Ubuntu Server**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

5. **Install Dependencies**
   ```bash
   sudo apt install -y curl apt-transport-https unzip wget libcap2-bin software-properties-common lsb-release gnupg2
   ```

## Installing Wazuh Server

1. **Add Wazuh Repository**
   ```bash
   curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo apt-key add -
   echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list
   sudo apt update
   ```

2. **Install Wazuh Manager**
   ```bash
   sudo apt install -y wazuh-manager
   ```

3. **Start Wazuh Manager**
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable wazuh-manager
   sudo systemctl start wazuh-manager
   ```

4. **Check Wazuh Manager Status**
   ```bash
   sudo systemctl status wazuh-manager
   ```

## Installing Wazuh Dashboard

More detailed instructions to be added soon.

## Troubleshooting

- **Service Not Starting**: Check logs with `sudo tail -f /var/ossec/logs/ossec.log`
- **Memory Issues**: Increase the VM's RAM allocation if needed
- **Connection Problems**: Verify firewall settings and network configuration

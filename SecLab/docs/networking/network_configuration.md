# Network Configuration for Your Cybersecurity Lab

This guide explains how to set up networking for your virtualized cybersecurity lab.

## Network Design

For a basic lab environment, we recommend using VMware's NAT network. This allows:
- Your VMs to communicate with each other
- VMs to access the internet through your host machine
- Your host machine to access services on the VMs
- Isolation from your physical network for security

## Configuring VMware Network Settings

1. **Open Virtual Network Editor**
   - In VMware Workstation Pro, go to Edit > Virtual Network Editor
   - You may need administrator privileges to make changes

2. **Configure NAT Network**
   - Select the VMnet8 (NAT) network
   - Verify that "NAT" is selected under "Connection Type"
   - Click "NAT Settings" to view or modify NAT configuration
   - Note the subnet settings (typically 192.168.x.0/24)

3. **Enable DHCP (Optional)**
   - Check "Use local DHCP service to distribute IP addresses to VMs"
   - Click "DHCP Settings" to view or modify DHCP configuration
   - Note the IP address range for DHCP

4. **Apply Changes**
   - Click "Apply" and then "OK" to save your settings

## Configuring VM Network Interfaces

### Kali Linux Network Setup

1. **Configure VM Network Adapter**
   - Right-click on your Kali VM and select "Settings"
   - Select the "Network Adapter"
   - Choose "NAT: Used to share the host's IP address"
   - Click "OK"

2. **Configure Static IP (Recommended)**
   - Inside Kali, edit the network configuration:
   ```bash
   sudo nano /etc/network/interfaces
   ```
   - Add or modify configuration for static IP:
   ```
   auto eth0
   iface eth0 inet static
       address 192.168.x.10
       netmask 255.255.255.0
       gateway 192.168.x.2
       dns-nameservers 8.8.8.8 8.8.4.4
   ```
   - Replace "192.168.x" with your actual subnet from VMware
   - Restart networking:
   ```bash
   sudo systemctl restart networking
   ```

### Ubuntu Server Network Setup

1. **Configure VM Network Adapter**
   - Right-click on your Ubuntu VM and select "Settings"
   - Select the "Network Adapter"
   - Choose "NAT: Used to share the host's IP address"
   - Click "OK"

2. **Configure Static IP (Recommended)**
   - For Ubuntu 20.04 and later, edit the Netplan configuration:
   ```bash
   sudo nano /etc/netplan/00-installer-config.yaml
   ```
   - Add or modify configuration:
   ```yaml
   network:
     version: 2
     ethernets:
       ens33:
         addresses: [192.168.x.20/24]
         gateway4: 192.168.x.2
         nameservers:
           addresses: [8.8.8.8, 8.8.4.4]
   ```
   - Replace "192.168.x" with your actual subnet from VMware
   - Apply the changes:
   ```bash
   sudo netplan apply
   ```

## Testing Network Connectivity

1. **Test Internal Connectivity**
   - From Kali Linux, ping the Ubuntu server:
   ```bash
   ping 192.168.x.20
   ```
   - From Ubuntu Server, ping Kali Linux:
   ```bash
   ping 192.168.x.10
   ```

2. **Test Internet Connectivity**
   - From both machines:
   ```bash
   ping 8.8.8.8
   ping google.com
   ```

## Troubleshooting

- **No network connectivity**: Check VM network adapter settings
- **Can't ping between VMs**: Verify IP addresses and subnet masks
- **Internet access issues**: Check gateway configuration
- **Host can't access VM services**: Check firewall settings on the VM

For more advanced networking setups, consider creating additional virtual networks for different security zones.

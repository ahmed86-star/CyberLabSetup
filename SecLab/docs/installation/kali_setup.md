# Setting Up Kali Linux

This guide walks you through setting up Kali Linux for your cybersecurity lab.

## Prerequisites
- VMware Workstation Pro installed
- Kali Linux ISO downloaded from the [official website](https://www.kali.org/downloads/)
- At least 25GB of free disk space
- 4GB+ RAM allocated to the VM

## Installation Steps

1. **Create a New Virtual Machine**
   - Launch VMware Workstation Pro
   - Click "Create a New Virtual Machine"
   - Select "Typical (recommended)" and click "Next"
   - Select "Installer disc image file (iso)" and browse to your Kali Linux ISO
   - Click "Next"

2. **Configure VM Settings**
   - Enter name: "Kali Linux"
   - Set location for VM files
   - Click "Next"
   - Set disk size (minimum 25GB recommended)
   - Select "Store virtual disk as a single file"
   - Click "Next"
   - Click "Customize Hardware"
   - Allocate at least 4GB RAM
   - Allocate 2+ processor cores if available
   - Click "Close" and then "Finish"

3. **Install Kali Linux**
   - Start the VM
   - Select "Graphical Install"
   - Follow the on-screen instructions for language, location, and keyboard
   - Set hostname, domain, and user credentials
   - Partition disks (use guided partitioning for simplicity)
   - Complete the installation and reboot

4. **Post-Installation Setup**
   - Update Kali: `sudo apt update && sudo apt upgrade -y`
   - Install VMware Tools: `sudo apt install -y open-vm-tools-desktop`
   - Reboot the VM

5. **Run the Setup Script**
   - Download the setup script: `wget https://raw.githubusercontent.com/ahmed86-star/CyberLabSetup/main/scripts/kali_setup.sh`
   - Make it executable: `chmod +x kali_setup.sh`
   - Run the script: `sudo ./kali_setup.sh`

## Additional Configuration

- **Configure Network Settings**
  - Ensure your VM is configured for NAT networking
  - Verify network connectivity

- **Install Additional Tools**
  - Use the script in this repository or manually install tools as needed

## Troubleshooting

- **Boot Issues**: Verify virtualization is enabled in your BIOS
- **Network Problems**: Check VM network settings and adapter configuration
- **Performance Issues**: Adjust RAM and CPU allocation as needed

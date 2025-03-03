# Setting Up VMware Workstation Pro

This guide walks you through the process of installing and configuring VMware Workstation Pro for your cybersecurity lab.

## System Requirements

- 64-bit x86 processor (Intel or AMD)
- 2+ GHz processor speed recommended
- 4+ CPU cores recommended for running multiple VMs
- 16+ GB RAM recommended
- 100+ GB free disk space

## Installation Steps

1. **Download VMware Workstation Pro**
   - Visit the [VMware website](https://www.vmware.com/products/workstation-pro.html)
   - Download the latest version for your operating system

2. **Install VMware Workstation Pro**
   - Run the installer and follow the on-screen instructions
   - Enter your license key when prompted (or choose the trial option)

3. **Initial Configuration**
   - Launch VMware Workstation Pro
   - Configure default network settings (Edit > Virtual Network Editor)
   - Set up a NAT network for your lab environment

## Troubleshooting

- **Performance issues**: Adjust the resource allocation for your VMs
- **Network connectivity problems**: Check your virtual network settings
- **Installation errors**: Make sure virtualization is enabled in your BIOS/UEFI

## Configuration for Optimal Performance

1. **Adjust Default VM Location (Optional)**
   - Go to Edit > Preferences
   - Select "Workspace"
   - Change the default location for virtual machines to a drive with plenty of space

2. **Network Configuration**
   - Go to Edit > Virtual Network Editor
   - Ensure you have a NAT network for your VMs to share
   - Verify the VMnet8 (NAT) settings

3. **Performance Settings**
   - Go to Edit > Preferences
   - Select "Memory"
   - Adjust the memory settings based on your system
   - Select "Priority"
   - Set appropriate priorities for VM processes

## Next Steps
After setting up VMware Workstation Pro, you can proceed to:
- [Setting up Kali Linux](kali_setup.md)
- [Setting up Ubuntu Server with Wazuh](ubuntu_wazuh_setup.md)

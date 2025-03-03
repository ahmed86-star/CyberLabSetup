# CyberLabSetup

A comprehensive resource for building a hands-on cybersecurity lab using VMware Workstation Pro. This guide walks you through creating a virtualized environment with three key components:
- Kali Linux with Metasploit for penetration testing (red team exercises).
- Ubuntu Server with Wazuh for blue team monitoring and defense.

## Introduction
This guide is designed for cybersecurity enthusiasts, students, and professionals who want to build a hands-on lab environment for practicing offensive and defensive security techniques. By following this guide, you'll create a virtualized lab using VMware Workstation Pro, complete with tools for penetration testing and monitoring.

## Prerequisites
Before you begin, ensure you have the following:
- VMware Workstation Pro installed on your system.
- ISO images for Kali Linux and Ubuntu Server.
- Sufficient CPU, RAM, and disk space for running multiple virtual machines (recommended: 16 GB RAM, 4+ CPU cores, 100+ GB free disk space).

## Quick Start
1. [Install VMware Workstation Pro](docs/installation/vmware_setup.md)
2. [Set Up Kali Linux](docs/installation/kali_setup.md)
3. [Set Up Ubuntu Server with Wazuh](docs/installation/ubuntu_wazuh_setup.md)
4. [Configure Networking](docs/networking/network_configuration.md)

## Usage
- [Red Team Exercises](docs/usage/red_team_exercises.md): Use Kali Linux with Metasploit to simulate attacks and test your skills.
- [Blue Team Monitoring](docs/usage/blue_team_monitoring.md): Use Ubuntu Server with Wazuh to detect and respond to simulated attacks.

## Lab Environment
![Lab Diagram](images/lab_diagram.png)
*Note: The diagram will be added soon.*

## Automation
The `scripts` directory contains helper scripts to automate parts of the setup process:
- `kali_setup.sh`: Configures Kali Linux with necessary tools
- `wazuh_setup.sh`: Automates Wazuh installation on Ubuntu Server

## Contributing
We welcome contributions to improve this guide! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 
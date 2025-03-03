#!/bin/bash
# Kali Linux setup script for CyberLabSetup

echo "[+] Starting Kali Linux setup..."

# Update system
echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

# Install essential tools
echo "[+] Installing essential tools..."
sudo apt install -y \
    metasploit-framework \
    nmap \
    wireshark \
    burpsuite \
    sqlmap \
    hydra \
    john \
    aircrack-ng \
    exploitdb \
    gobuster \
    dirb

# Configure Metasploit
echo "[+] Setting up Metasploit..."
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo msfdb init

# Set up workspace
echo "[+] Creating workspace directory..."
mkdir -p ~/cybersecurity-lab/projects
mkdir -p ~/cybersecurity-lab/tools
mkdir -p ~/cybersecurity-lab/reports

echo "[+] Setup complete! Your Kali Linux environment is ready."

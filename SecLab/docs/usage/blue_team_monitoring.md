# Blue Team Monitoring with Wazuh

This guide covers how to use Wazuh for security monitoring and incident response in your cybersecurity lab.

## Introduction to Wazuh

Wazuh is an open-source security monitoring solution that provides:
- Host-based intrusion detection
- Log data analysis
- File integrity monitoring
- Vulnerability detection
- Configuration assessment
- Incident response

## Accessing the Wazuh Dashboard

1. **Open your web browser**
2. **Navigate to your Wazuh dashboard**
   - If using IP: `https://192.168.x.20`
   - Default credentials: admin/admin
   - Change the default password on first login

## Key Monitoring Features

### 1. Security Events

The "Security events" section shows:
- Alerts from all agents
- MITRE ATT&CK framework mapping
- Severity levels
- Source of detection (SCA, rootkit detection, etc.)

To view security events:
1. Go to "Security events" in the main menu
2. Use filters to narrow down events of interest
3. Click on individual events to see details

### 2. Integrity Monitoring

File integrity monitoring (FIM) tracks changes to important files.

To configure FIM:
1. Go to "Management" > "Configuration"
2. Select your agent
3. Navigate to "Integrity monitoring"
4. Add directories to monitor
5. Configure real-time monitoring for critical paths

### 3. Vulnerability Detection

Wazuh can scan for known vulnerabilities in installed packages.

To view vulnerabilities:
1. Go to "Vulnerability detector" in the main menu
2. Review detected vulnerabilities by severity
3. Check affected packages and available fixes

### 4. Policy Monitoring

Wazuh can check system configurations against security benchmarks.

To view policy compliance:
1. Go to "Regulatory compliance" in the main menu
2. Select compliance frameworks (PCI DSS, GDPR, etc.)
3. Review failed checks and remediation advice

## Setting Up Alerts and Notifications

1. **Configure Email Alerts**
   - Go to "Management" > "Configuration"
   - Select "Email alerts" 
   - Configure your SMTP settings
   - Define alert levels that trigger notifications

2. **Create Custom Alerts**
   - Go to "Management" > "Rules"
   - Create custom rules for specific events
   - Set appropriate alert levels

## Responding to Incidents

When Wazuh detects suspicious activity:

1. **Investigate the Alert**
   - Review the full alert details
   - Check related events before and after the alert
   - Examine affected files or processes

2. **Contain the Threat**
   - Isolate affected systems if necessary
   - Stop compromised services
   - Block malicious IPs at the firewall

3. **Remediate**
   - Remove malware or backdoors
   - Patch vulnerabilities
   - Fix misconfigurations
   - Restore from backup if necessary

4. **Document the Incident**
   - Record all findings and actions taken
   - Update security policies if needed
   - Improve detection rules based on the incident

## Lab Exercises

1. **Setting Up Wazuh Agents**
   - Install Wazuh agent on Kali Linux
   - Configure agent groups
   - Test agent-server communication

2. **Detecting Attacks**
   - Run a port scan from Kali to Ubuntu
   - Observe alerts in the Wazuh dashboard
   - Identify the attack pattern

3. **File Integrity Monitoring**
   - Create a baseline of critical system files
   - Make authorized and unauthorized changes
   - Review FIM alerts and differentiate between them

4. **Creating Custom Rules**
   - Develop rules for specific attack scenarios
   - Test the rules with simulated attacks
   - Refine rules to reduce false positives

## Troubleshooting

- **Missing Events**: Check agent status and log collection configuration
- **False Positives**: Tune rules to reduce unnecessary alerts
- **Dashboard Issues**: Verify Elasticsearch and Kibana status
- **Agent Connection Problems**: Check firewall settings and agent keys

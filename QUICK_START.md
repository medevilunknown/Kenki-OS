# 🚀 KENKI OS Quick Start Guide

Welcome to **KENKI OS (TrAEL AI Edition)** - the AI-enhanced security platform for ethical hackers!

## ⚡ Quick Setup (5 minutes)

### 1. Install Dependencies
```bash
# Install Python dependencies
pip install -r requirements.txt

# Install security tools (if not on BlackArch)
sudo pacman -S blackarch
```

### 2. Configure API Keys
```bash
# Edit the configuration file
nano ai-assist/config.json
```

Add your API keys:
```json
{
  "anthropic_api_key": "your-claude-api-key-here",
  "openai_api_key": "your-openai-key-here"
}
```

### 3. Test Installation
```bash
# Run the test suite
python test_kenki.py
```

### 4. Start Using KENKI
```bash
# Interactive mode
python ai-assist/kenki_assist.py --interactive

# Single command
python ai-assist/kenki_assist.py "explain nmap -sS -p 80 192.168.1.1"
```

## 🎯 Common Use Cases

### Command Explanation
```bash
# Explain any Linux/security command
kenki-assist "explain sqlmap -u http://target.com/page.php?id=1"
kenki-assist "what does hydra -l admin -P wordlist.txt ssh://target.com do?"
```

### Natural Language to Shell
```bash
# Convert requests to commands
kenki-assist "find all open ports on this network"
kenki-assist "scan for SQL injection vulnerabilities"
kenki-assist "crack the password hash"
```

### Security Tool Guidance
```bash
# Get detailed tool help
kenki-assist --analyze metasploit
kenki-assist --analyze nmap
kenki-assist --analyze wireshark
```

### Log Analysis
```bash
# Analyze log files
kenki-assist --log /var/log/auth.log
kenki-assist --log /var/log/apache2/access.log
```

## 🎤 Voice Interface

### Start Voice Mode
```bash
# Interactive voice mode
python ai-assist/voice.py --interactive

# Test voice recognition
python ai-assist/voice.py --test
```

### Voice Commands
- "Explain nmap"
- "Translate find open ports"
- "Analyze metasploit"
- "Help"
- "Stop"

## 🔧 Advanced Configuration

### Customize AI Models
Edit `ai-assist/config.json`:
```json
{
  "preferences": {
    "default_model": "claude",
    "max_tokens": 1000,
    "temperature": 0.7
  },
  "local_llm": {
    "enabled": true,
    "model_path": "models/mistral.gguf"
  }
}
```

### Shell Integration
Add to your `.zshrc`:
```bash
# KENKI aliases
alias kenki='python ~/.kenki/ai-assist/kenki_assist.py'
alias kenki-voice='python ~/.kenki/ai-assist/voice.py'
alias kenki-explain='python ~/.kenki/ai-assist/explain.py'
alias kenki-translate='python ~/.kenki/ai-assist/translate.py'
```

## 🛠️ Available Security Tools

### Reconnaissance
- `nmap` - Network scanning
- `amass` - Subdomain enumeration
- `theHarvester` - Email/domain discovery
- `recon-ng` - Reconnaissance framework

### Web Testing
- `nikto` - Web vulnerability scanner
- `dirb` - Directory brute forcer
- `sqlmap` - SQL injection testing
- `wpscan` - WordPress security scanner

### Password Attacks
- `hydra` - Brute force attacks
- `john` - Password cracking
- `hashcat` - Advanced password recovery

### Wireless
- `aircrack-ng` - Wireless security testing
- `wifite` - Automated wireless attacks
- `reaver` - WPS attacks

### Forensics
- `volatility` - Memory forensics
- `ghidra` - Reverse engineering
- `radare2` - Binary analysis

### Exploitation
- `metasploit` - Exploitation framework
- `beEF` - Browser exploitation
- `social-engineer-toolkit` - Social engineering

## 🎮 Interactive Examples

### Example 1: Network Scanning
```
🔍 KENKI> explain nmap -sS -p 80,443,22 192.168.1.1
💡 This is a SYN scan targeting common ports on a specific IP...

🔍 KENKI> translate scan all ports on this subnet
💡 nmap -sS -p- 192.168.1.0/24
```

### Example 2: Web Security
```
🔍 KENKI> explain sqlmap -u http://target.com/page.php?id=1
💡 This SQLMap command tests for SQL injection vulnerabilities...

🔍 KENKI> translate find SQL injection vulnerabilities
💡 sqlmap -u http://target.com/page.php?id=1 --batch
```

### Example 3: Password Attacks
```
🔍 KENKI> explain hydra -l admin -P wordlist.txt ssh://target.com
💡 This Hydra command performs a brute force attack...

🔍 KENKI> translate crack SSH password
💡 hydra -l username -P /usr/share/wordlists/rockyou.txt ssh://target.com
```

## 🔍 Troubleshooting

### Common Issues

**1. API Key Errors**
```bash
# Check your configuration
cat ai-assist/config.json
# Make sure your API keys are set correctly
```

**2. Missing Dependencies**
```bash
# Install missing packages
pip install -r requirements.txt
sudo pacman -S blackarch
```

**3. Voice Interface Not Working**
```bash
# Install audio dependencies
sudo pacman -S python-pyaudio portaudio
pip install speechrecognition pyttsx3
```

**4. Security Tools Not Found**
```bash
# Install BlackArch tools
sudo pacman -S blackarch
# Or install individual tools
sudo pacman -S nmap nikto dirb sqlmap hydra john hashcat
```

### Getting Help

```bash
# Show all options
kenki-assist --help

# Test the installation
python test_kenki.py

# Run the demo
python demo.py
```

## 🚨 Important Notes

### Legal and Ethical Use
- ✅ Use only on systems you own or have explicit permission to test
- ✅ Follow responsible disclosure practices
- ✅ Comply with all applicable laws and regulations
- ❌ Never use for unauthorized access or malicious purposes

### Security Best Practices
- Keep your API keys secure
- Use strong passwords for your systems
- Regularly update your tools and dependencies
- Document your testing procedures
- Report vulnerabilities responsibly

## 🎉 You're Ready!

You now have a powerful AI-enhanced security platform at your fingertips. The KENKI OS assistant can help you:

- Understand complex security commands
- Convert natural language to shell commands
- Get guidance on security tools
- Analyze log files and data
- Work hands-free with voice commands

**Happy ethical hacking! 🧠🔐**

---

*For more information, see the main [README.md](README.md) file.* 
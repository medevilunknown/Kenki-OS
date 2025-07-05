# 🧠 KENKI OS - AI-Enhanced Security Platform

**KENKI OS (TrAEL AI Edition)** is a custom BlackArch Linux-based operating system enhanced with AI capabilities for ethical hackers and security professionals. The OS integrates Claude 4 cloud AI and local LLMs for command explanation, natural language to shell translation, security tool guidance, and voice interaction.

![KENKI OS Banner](https://img.shields.io/badge/KENKI-OS-purple?style=for-the-badge&logo=linux)
![BlackArch Based](https://img.shields.io/badge/BlackArch-Based-red?style=for-the-badge)
![AI Enhanced](https://img.shields.io/badge/AI-Enhanced-blue?style=for-the-badge)

## 🚀 Features

### 🤖 AI Assistant Capabilities
- **Command Explanation**: Get detailed explanations of any command or tool
- **Natural Language Translation**: Convert natural language to shell commands
- **Security Tool Guidance**: AI-powered assistance for penetration testing tools
- **Voice Interface**: Hands-free operation with voice commands
- **Local LLM Support**: Integration with llama.cpp and other local models
- **Cloud AI Integration**: Claude 4 API support for advanced reasoning

### 🛡️ Security Tools (2800+ BlackArch Tools)
- **Network Analysis**: nmap, wireshark, tcpdump, netcat
- **Web Application Testing**: sqlmap, nikto, dirb, wpscan, joomscan
- **Password Cracking**: john, hashcat, hydra
- **Wireless Security**: aircrack-ng suite
- **Forensics**: volatility, autopsy
- **Reverse Engineering**: ghidra, radare2
- **Social Engineering**: maltego, recon-ng
- **Vulnerability Assessment**: nessus, openvas, zap, burp

### 🎨 Custom User Experience
- **Custom GRUB Theme**: KENKI OS branding
- **Desktop Branding**: Custom wallpaper and desktop shortcuts
- **Interactive First-Run**: Guided setup process
- **Auto-Launch AI Assistant**: Starts automatically on boot
- **Professional UI**: Modern desktop environment with XFCE

## 📁 Project Structure

```
KENKI OS/
├── ai-assist/                    # AI Assistant Core
│   ├── kenki_assist.py          # Main CLI interface
│   ├── explain.py               # Command explanation module
│   ├── translate.py             # Natural language translation
│   ├── voice.py                 # Voice interface
│   ├── config.json              # Configuration file
│   └── requirements.txt         # Python dependencies
├── install/                      # Installation Scripts
│   ├── install.sh               # Main installation script
│   └── post-install.sh          # Post-installation setup
├── archiso/                      # ISO Build Configuration
│   └── releng/                  # Archiso profile
│       ├── ai-assist-overlay/   # Custom files overlay
│       ├── packages.x86_64      # Package list
│       └── profiledef.sh        # Build configuration
├── tests/                        # Test Suite
│   └── test_kenki.py           # AI assistant tests
├── demo/                         # Demo Scripts
│   └── demo.py                  # Interactive demo
├── docs/                         # Documentation
│   └── QUICK_START.md          # Quick start guide
├── build-iso.sh                 # Automated build script
└── README.md                    # This file
```

## 🛠️ Quick Start

### Prerequisites
- Arch Linux or Arch-based system (for building)
- At least 10GB free disk space
- Root access (for ISO building)

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/kenki-os.git
cd kenki-os
```

### 2. Build the ISO
```bash
sudo ./build-iso.sh
```

The build process will:
- Install required dependencies (archiso)
- Set up the BlackArch-based profile
- Copy AI assistant files to the overlay
- Apply custom branding and configurations
- Build the ISO (30-60 minutes)

### 3. Test the ISO
```bash
# Test in QEMU (recommended)
qemu-system-x86_64 -enable-kvm -m 4G -smp 4 -boot d -cdrom archiso/releng/out/kenki-os-*.iso

# Or use VirtualBox/VMware
```

### 4. First Boot Setup
1. Boot the ISO
2. Run the first-run script: `/etc/kenki/first-run.sh`
3. Configure API keys: `nano /etc/kenki/ai-assist/config.json`
4. Start the AI assistant: `kenki-assist`

## 🤖 AI Assistant Usage

### Basic Commands
```bash
# Start interactive mode
kenki-assist

# Explain a command
kenki-assist explain "nmap -sS -p 80 192.168.1.1"

# Translate natural language to command
kenki-assist translate "scan for open ports on my local network"

# Voice mode
kenki-assist voice
```

### Configuration
Edit `/etc/kenki/ai-assist/config.json`:
```json
{
  "claude_api_key": "your-claude-api-key",
  "openai_api_key": "your-openai-api-key",
  "local_model_path": "/path/to/llama.cpp/model",
  "voice_enabled": true,
  "auto_explain": true
}
```

### Voice Commands
- "Scan network" → Runs network discovery
- "Check vulnerabilities" → Launches vulnerability scanner
- "Explain tool" → Gets tool explanation
- "Show help" → Displays available commands

## 🧪 Testing

### Run Test Suite
```bash
cd tests
python test_kenki.py
```

### Demo Mode
```bash
cd demo
python demo.py
```

## 🔧 Customization

### Adding Custom Tools
1. Add packages to `archiso/releng/packages.x86_64`
2. Update AI assistant knowledge in `ai-assist/kenki_assist.py`
3. Rebuild the ISO

### Modifying AI Behavior
- Edit `ai-assist/kenki_assist.py` for core logic
- Modify `ai-assist/config.json` for settings
- Update voice commands in `ai-assist/voice.py`

### Custom Branding
- Replace `archiso/releng/ai-assist-overlay/etc/kenki/kenki-wallpaper.png`
- Edit GRUB theme in `archiso/releng/ai-assist-overlay/etc/kenki/kenki-grub-theme/`
- Modify desktop shortcuts in overlay

## 📚 Documentation

- [Quick Start Guide](docs/QUICK_START.md) - Getting started with KENKI OS
- [AI Assistant Guide](ai-assist/README.md) - Using the AI features
- [Build Guide](archiso/releng/README.md) - Customizing the ISO build

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### Development Setup
```bash
# Install development dependencies
pip install -r ai-assist/requirements.txt

# Run tests
python tests/test_kenki.py

# Test AI assistant locally
python ai-assist/kenki_assist.py --interactive
```

## ⚠️ Legal and Ethical Notice

**IMPORTANT**: KENKI OS is designed for ethical hacking and authorized security testing only.

- ✅ **Authorized**: Use on systems you own or have explicit permission to test
- ❌ **Unauthorized**: Never use on systems without permission
- 🔒 **Compliance**: Follow all applicable laws and regulations
- 📋 **Documentation**: Keep detailed records of all testing activities

The developers are not responsible for any misuse of this software.

## 🆘 Troubleshooting

### Common Issues

**Build Fails**
```bash
# Check disk space
df -h

# Clean previous builds
sudo rm -rf archiso/releng/work archiso/releng/out

# Reinstall archiso
sudo pacman -S --noconfirm archiso
```

**AI Assistant Not Working**
```bash
# Check API keys
cat /etc/kenki/ai-assist/config.json

# Test connectivity
curl -I https://api.anthropic.com

# Check Python dependencies
pip list | grep -E "(anthropic|openai)"
```

**Voice Interface Issues**
```bash
# Install audio dependencies
sudo pacman -S pulseaudio alsa-utils

# Test microphone
arecord -d 5 test.wav && aplay test.wav
```

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/your-username/kenki-os/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-username/kenki-os/discussions)
- **Documentation**: [Wiki](https://github.com/your-username/kenki-os/wiki)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **BlackArch Linux** - Base security distribution
- **Arch Linux** - Base system
- **Anthropic** - Claude AI API
- **OpenAI** - GPT API
- **llama.cpp** - Local LLM support

---

**🧠 KENKI OS - Where AI Meets Ethical Hacking**

*Built with ❤️ for the security community*
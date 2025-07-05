#!/bin/bash
# KENKI OS ISO Build Script
# Automates the complete ISO building process

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# KENKI OS Banner
echo -e "${PURPLE}"
cat << "EOF"
 ██ ▄█▀▄▄▄█████▓ ▒█████   ██ ▄█▀ ██▓ ██▓    
 ██▄█▒ ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒ ▓██▒▓██▒    
▓███▄░ ▒ ▓██░ ▒░▒██░  ██▒▓███▄░ ▒██▒▒██░    
▓██ █▄ ░ ▓██▓ ░ ▒██   ██░▓██ █▄ ░██░▒██░    
▒██▒ █▄░ ▒██▒ ░ ░ ████▓▒░▒██▒ █▄░██░░██████▒
▒ ▒▒ ▓▒ ░ ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░▓  ░ ▒░▓  ░
░ ░▒ ▒░ ░ ░      ░ ▒ ▒ ▒░ ░ ░▒ ▒░ ▒ ░░ ░ ▒  ░
░ ░░ ░  ░ ░    ░ ░ ░ ▒  ░ ░░ ░  ▒ ░  ░ ░   
░  ░                 ░ ░  ░  ░      ░  ░    
EOF
echo -e "${NC}"

echo -e "${GREEN}🧠 KENKI OS - AI-Enhanced Security Platform${NC}"
echo -e "${CYAN}Building custom BlackArch-based ISO...${NC}"
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}❌ This script must be run as root (use sudo)${NC}"
    exit 1
fi

# Check if archiso is installed
if ! command -v mkarchiso &> /dev/null; then
    echo -e "${YELLOW}📦 Installing archiso...${NC}"
    pacman -S --noconfirm archiso
fi

# Check if we're in the right directory
if [ ! -d "archiso/releng" ]; then
    echo -e "${RED}❌ archiso/releng directory not found${NC}"
    echo "Please run this script from the KENKI OS project root"
    exit 1
fi

# Function to log with timestamp
log() {
    echo -e "${GREEN}[$(date +%H:%M:%S)]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[$(date +%H:%M:%S)]${NC} $1"
}

error() {
    echo -e "${RED}[$(date +%H:%M:%S)]${NC} $1"
}

# Check available disk space
log "Checking disk space..."
AVAILABLE_SPACE=$(df . | awk 'NR==2 {print $4}')
REQUIRED_SPACE=10000000  # 10GB in KB

if [ "$AVAILABLE_SPACE" -lt "$REQUIRED_SPACE" ]; then
    error "Insufficient disk space. Need at least 10GB free."
    echo "Available: $(($AVAILABLE_SPACE / 1024 / 1024))GB"
    exit 1
fi

log "Disk space OK: $(($AVAILABLE_SPACE / 1024 / 1024))GB available"

# Check if AI assistant files exist
log "Verifying AI assistant files..."
if [ ! -f "ai-assist/kenki_assist.py" ]; then
    error "AI assistant files not found"
    exit 1
fi

if [ ! -f "install/install.sh" ]; then
    error "Install script not found"
    exit 1
fi

log "✅ All required files found"

# Copy AI assistant files to overlay
log "Setting up AI assistant overlay..."
mkdir -p archiso/releng/ai-assist-overlay/etc/kenki/ai-assist
cp -r ai-assist/* archiso/releng/ai-assist-overlay/etc/kenki/ai-assist/
cp install/install.sh archiso/releng/ai-assist-overlay/etc/kenki/
cp install/setup-local-llm.sh archiso/releng/ai-assist-overlay/etc/kenki/

# Make scripts executable
chmod +x archiso/releng/ai-assist-overlay/etc/kenki/install.sh
chmod +x archiso/releng/ai-assist-overlay/etc/kenki/first-run.sh
chmod +x archiso/releng/ai-assist-overlay/etc/kenki/kenki-setup.sh
chmod +x archiso/releng/ai-assist-overlay/etc/kenki/setup-local-llm.sh

log "✅ AI assistant overlay prepared"

# Check if we need to copy the standard archiso files
if [ ! -f "archiso/releng/build.sh" ]; then
    log "Setting up standard archiso files..."
    cp -r /usr/share/archiso/configs/releng/* archiso/releng/
    
    # Override with our custom files
    log "Applying KENKI OS customizations..."
fi

# Update profiledef.sh with our customizations
log "Updating profiledef.sh..."
cat > archiso/releng/profiledef.sh << 'EOF'
#!/usr/bin/env bash
# profiledef.sh for KENKI OS (BlackArch-based)

iso_name="kenki-os"
iso_label="KENKI_$(date +%Y%m)"
iso_publisher="KENKI OS <https://github.com/your-username/kenki-os>"
iso_application="KENKI OS - AI-Enhanced BlackArch Security Distribution"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=(iso)

arch="x86_64"

file_permissions=(
  ["/etc/kenki/"]="0:0:755"
  ["/etc/kenki/ai-assist/"]="0:0:755"
  ["/etc/kenki/install.sh"]="0:0:755"
  ["/etc/kenki/first-run.sh"]="0:0:755"
  ["/etc/kenki/kenki-setup.sh"]="0:0:755"
  ["/etc/kenki/ai-assist/kenki_assist.py"]="0:0:755"
  ["/etc/kenki/ai-assist/explain.py"]="0:0:755"
  ["/etc/kenki/ai-assist/translate.py"]="0:0:755"
  ["/etc/kenki/ai-assist/voice.py"]="0:0:755"
  ["/etc/kenki/ai-assist/config.json"]="0:0:644"
  ["/etc/kenki/setup-local-llm.sh"]="0:0:755"
)

# Copy custom files into the ISO
ai_assist_overlay() {
  mkdir -p "${work_dir}/ai-assist-overlay/etc/kenki/ai-assist"
  cp -r "${script_path}/../../ai-assist/"* "${work_dir}/ai-assist-overlay/etc/kenki/ai-assist/"
  cp "${script_path}/../../install/install.sh" "${work_dir}/ai-assist-overlay/etc/kenki/install.sh"
  cp "${script_path}/../../install/setup-local-llm.sh" "${work_dir}/ai-assist-overlay/etc/kenki/setup-local-llm.sh"
  cp "${script_path}/ai-assist-overlay/etc/kenki/"* "${work_dir}/ai-assist-overlay/etc/kenki/"
}

ai_assist_overlay
file_permissions+=( ["/etc/kenki/"]="0:0:755" )
file_permissions+=( ["/etc/kenki/ai-assist/"]="0:0:755" )
file_permissions+=( ["/etc/kenki/install.sh"]="0:0:755" )
file_permissions+=( ["/etc/kenki/first-run.sh"]="0:0:755" )
file_permissions+=( ["/etc/kenki/kenki-setup.sh"]="0:0:755" )
file_permissions+=( ["/etc/kenki/setup-local-llm.sh"]="0:0:755" )
EOF

log "✅ profiledef.sh updated"

# Check if packages.x86_64 exists, if not create it
if [ ! -f "archiso/releng/packages.x86_64" ]; then
    log "Creating packages.x86_64..."
    cat > archiso/releng/packages.x86_64 << 'EOF'
# BlackArch base
blackarch

# Desktop environments (choose one or more)
xfce4
xfce4-goodies
# i3-gaps
# sway

# Terminal emulators
alacritty
kitty

# Shell and prompt
zsh
starship
oh-my-zsh-git

# Python and AI dependencies
python
python-pip
nodejs
npm
llama-cpp-python
cmake
ninja

# Security tools (ensure these are present)
nmap
nikto
dirb
sqlmap
hydra
john
hashcat
aircrack-ng
wireshark-qt
tcpdump
netcat
volatility
ghidra
radare2
maltego
recon-ng
theharvester
amass
wpscan
joomscan
skipfish
w3af
zap
burp
nessus
openvas

# Utilities
fzf
ripgrep
bat
exa
fd
htop
neofetch
curl
wget
unzip
git
base-devel

# Virtualization
qemu
virt-manager
virtualbox
docker
docker-compose

# GUI tools (optional)
firefox
chromium
gimp
inkscape
audacity
vlc
obs-studio
EOF
    log "✅ packages.x86_64 created"
fi

# Create systemd service
log "Creating systemd service..."
cat > archiso/releng/ai-assist-launcher.service << 'EOF'
[Unit]
Description=KENKI OS AI Assistant Launcher
After=network.target

[Service]
Type=simple
User=%i
WorkingDirectory=%h/.kenki
ExecStart=/usr/bin/python3 /etc/kenki/ai-assist/kenki_assist.py --interactive
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOF

log "✅ Systemd service created"

# Build the ISO
log "🚀 Starting ISO build process..."
log "This may take 30-60 minutes depending on your system..."

cd archiso/releng

# Clean previous builds
if [ -d "work" ]; then
    log "Cleaning previous build..."
    rm -rf work
fi

if [ -d "out" ]; then
    log "Cleaning previous output..."
    rm -rf out
fi

# Start the build
log "Building KENKI OS ISO..."
if mkarchiso -v .; then
    echo ""
    echo -e "${GREEN}🎉 KENKI OS ISO build completed successfully!${NC}"
    echo ""
    
    # Find the output ISO
    if [ -d "out" ]; then
        ISO_FILE=$(find out -name "*.iso" | head -1)
        if [ -n "$ISO_FILE" ]; then
            echo -e "${GREEN}📦 ISO created: ${ISO_FILE}${NC}"
            echo -e "${CYAN}📏 Size: $(du -h "$ISO_FILE" | cut -f1)${NC}"
            echo ""
            echo -e "${YELLOW}🧪 Next steps:${NC}"
            echo "1. Test the ISO in a VM (VirtualBox, QEMU, UTM)"
            echo "2. Boot the ISO and run the first-run script"
            echo "3. Configure your API keys in /etc/kenki/ai-assist/config.json"
            echo "4. Start using KENKI OS for ethical hacking!"
            echo ""
            echo -e "${BLUE}💡 Tips:${NC}"
            echo "• The ISO includes all BlackArch tools (2800+)"
            echo "• AI assistant is preloaded and ready to use"
            echo "• Custom GRUB theme and desktop branding included"
            echo "• Voice interface available for hands-free operation"
            echo ""
            echo -e "${PURPLE}🧠 KENKI OS - AI-Enhanced Security Platform${NC}"
            echo -e "${YELLOW}⚠️ Remember: Use these tools responsibly and only on authorized systems!${NC}"
        else
            error "ISO file not found in output directory"
        fi
    else
        error "Output directory not found"
    fi
else
    error "ISO build failed"
    exit 1
fi 
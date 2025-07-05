#!/bin/bash
# KENKI OS - macOS Test Script
# Test AI assistant components on macOS before building ISO

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

echo -e "${GREEN}🧠 KENKI OS - macOS Test Script${NC}"
echo -e "${CYAN}Testing AI assistant components on macOS...${NC}"
echo ""

log() {
    echo -e "${GREEN}[$(date +%H:%M:%S)]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[$(date +%H:%M:%S)]${NC} $1"
}

error() {
    echo -e "${RED}[$(date +%H:%M:%S)]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "ai-assist/kenki_assist.py" ]; then
    error "❌ AI assistant files not found"
    echo "Please run this script from the KENKI OS project root"
    exit 1
fi

log "✅ Found AI assistant files"

# Check Python version
log "Checking Python version..."
python_version=$(python3 --version 2>&1 | cut -d' ' -f2)
echo "Python version: $python_version"

# Check if pip is available
if ! command -v pip3 &> /dev/null; then
    error "❌ pip3 not found"
    echo "Please install pip3: brew install python3"
    exit 1
fi

log "✅ pip3 available"

# Install Python dependencies
log "Installing Python dependencies..."
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt
    log "✅ Dependencies installed"
else
    warn "⚠️ requirements.txt not found, installing basic dependencies..."
    pip3 install anthropic openai speechrecognition pyaudio
    log "✅ Basic dependencies installed"
fi

# Test AI assistant
log "Testing AI assistant..."
if python3 ai-assist/kenki_assist.py "test" > /dev/null 2>&1; then
    log "✅ AI assistant loads successfully"
else
    warn "⚠️ AI assistant needs API keys configured"
fi

# Test command explanation
log "Testing command explanation..."
test_output=$(python3 ai-assist/kenki_assist.py "explain ls -la" 2>/dev/null)
if [ $? -eq 0 ]; then
    log "✅ Command explanation works"
    echo -e "${CYAN}Sample output:${NC}"
    echo "$test_output" | head -5
else
    warn "⚠️ Command explanation needs API keys"
fi

# Test natural language translation
log "Testing natural language translation..."
test_output=$(python3 ai-assist/kenki_assist.py "translate list files" 2>/dev/null)
if [ $? -eq 0 ]; then
    log "✅ Natural language translation works"
    echo -e "${CYAN}Sample output:${NC}"
    echo "$test_output" | head -5
else
    warn "⚠️ Translation needs API keys"
fi

# Check voice interface
log "Checking voice interface..."
if python3 -c "import speech_recognition, pyaudio" 2>/dev/null; then
    log "✅ Voice interface dependencies available"
else
    warn "⚠️ Voice interface needs audio dependencies"
    echo "Install with: brew install portaudio"
fi

# Test configuration
log "Checking configuration..."
if [ -f "ai-assist/config.json" ]; then
    log "✅ Configuration file exists"
    
    # Check if API keys are configured
    if grep -q "YOUR_CLAUDE_API_KEY_HERE" ai-assist/config.json; then
        warn "⚠️ API keys not configured"
        echo "Edit ai-assist/config.json to add your API keys"
    else
        log "✅ API keys appear to be configured"
    fi
else
    warn "⚠️ Configuration file not found"
    echo "Create ai-assist/config.json with your API keys"
fi

# Show available commands
echo ""
echo -e "${BLUE}🤖 Available AI Assistant Commands:${NC}"
echo "• python3 ai-assist/kenki_assist.py --interactive"
echo "• python3 ai-assist/kenki_assist.py 'explain nmap -sS'"
echo "• python3 ai-assist/kenki_assist.py 'translate scan network'"
echo "• python3 ai-assist/voice.py --interactive"

# Show next steps
echo ""
echo -e "${YELLOW}📋 Next Steps:${NC}"
echo "1. Configure API keys in ai-assist/config.json"
echo "2. Test AI assistant: python3 ai-assist/kenki_assist.py --interactive"
echo "3. Set up Arch Linux VM for ISO building"
echo "4. Follow VM_SETUP_GUIDE.md for full build process"

# Test interactive mode
echo ""
echo -e "${CYAN}🧪 Quick Test Options:${NC}"
echo "1. Test AI assistant (interactive mode)"
echo "2. Test command explanation"
echo "3. Test natural language translation"
echo "4. Skip tests"

read -p "Choose an option (1-4): " choice

case $choice in
    1)
        echo -e "${GREEN}🎯 Starting AI Assistant in interactive mode...${NC}"
        python3 ai-assist/kenki_assist.py --interactive
        ;;
    2)
        echo -e "${GREEN}🧪 Testing command explanation...${NC}"
        python3 ai-assist/kenki_assist.py "explain nmap -sS -p 80 192.168.1.1"
        ;;
    3)
        echo -e "${GREEN}🧪 Testing natural language translation...${NC}"
        python3 ai-assist/kenki_assist.py "translate find open ports on my network"
        ;;
    4)
        echo -e "${CYAN}👋 Skipping tests. Check VM_SETUP_GUIDE.md for next steps!${NC}"
        ;;
    *)
        echo -e "${YELLOW}Invalid choice. Exiting...${NC}"
        ;;
esac

echo ""
echo -e "${GREEN}🎉 KENKI OS macOS test complete!${NC}"
echo -e "${YELLOW}⚠️ Remember: Full ISO build requires Arch Linux VM${NC}" 
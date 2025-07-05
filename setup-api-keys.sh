#!/bin/bash
# KENKI OS - API Key Setup Script
# Helps configure API keys for the AI assistant

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

echo -e "${GREEN}🧠 KENKI OS - API Key Setup${NC}"
echo -e "${CYAN}Configure API keys for AI assistant...${NC}"
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

# Check if config file exists
if [ ! -f "ai-assist/config.json" ]; then
    error "❌ Config file not found"
    exit 1
fi

log "✅ Found config file"

# Create backup
cp ai-assist/config.json ai-assist/config.json.backup
log "✅ Created backup of config file"

echo -e "${BLUE}🔑 API Key Setup Options:${NC}"
echo "1. Claude API (Anthropic) - Recommended for security expertise"
echo "2. OpenAI API - Alternative AI provider"
echo "3. Both APIs - Maximum AI capabilities"
echo "4. Skip API setup (use basic mode)"
echo "5. Test current configuration"

read -p "Choose an option (1-5): " choice

case $choice in
    1)
        echo -e "${GREEN}🔑 Setting up Claude API...${NC}"
        echo ""
        echo -e "${YELLOW}📋 To get your Claude API key:${NC}"
        echo "1. Go to: https://console.anthropic.com/"
        echo "2. Sign up or log in"
        echo "3. Go to 'API Keys' section"
        echo "4. Create a new API key"
        echo "5. Copy the key (starts with 'sk-ant-...')"
        echo ""
        read -p "Enter your Claude API key: " claude_key
        
        if [ -n "$claude_key" ]; then
            # Update config with Claude key
            python3 -c "
import json
import os

config_file = 'ai-assist/config.json'
with open(config_file, 'r') as f:
    config = json.load(f)

config['anthropic_api_key'] = '$claude_key'
config['preferences']['default_model'] = 'claude'

with open(config_file, 'w') as f:
    json.dump(config, f, indent=2)

print('✅ Claude API key configured!')
"
            log "✅ Claude API key configured"
        else
            warn "⚠️ No key provided, skipping Claude setup"
        fi
        ;;
        
    2)
        echo -e "${GREEN}🔑 Setting up OpenAI API...${NC}"
        echo ""
        echo -e "${YELLOW}📋 To get your OpenAI API key:${NC}"
        echo "1. Go to: https://platform.openai.com/"
        echo "2. Sign up or log in"
        echo "3. Go to 'API Keys' section"
        echo "4. Create a new API key"
        echo "5. Copy the key (starts with 'sk-...')"
        echo ""
        read -p "Enter your OpenAI API key: " openai_key
        
        if [ -n "$openai_key" ]; then
            # Update config with OpenAI key
            python3 -c "
import json
import os

config_file = 'ai-assist/config.json'
with open(config_file, 'r') as f:
    config = json.load(f)

config['openai_api_key'] = '$openai_key'

with open(config_file, 'w') as f:
    json.dump(config, f, indent=2)

print('✅ OpenAI API key configured!')
"
            log "✅ OpenAI API key configured"
        else
            warn "⚠️ No key provided, skipping OpenAI setup"
        fi
        ;;
        
    3)
        echo -e "${GREEN}🔑 Setting up both APIs...${NC}"
        echo ""
        echo -e "${YELLOW}📋 Claude API Setup:${NC}"
        echo "1. Go to: https://console.anthropic.com/"
        echo "2. Get your Claude API key"
        echo ""
        read -p "Enter your Claude API key: " claude_key
        
        echo ""
        echo -e "${YELLOW}📋 OpenAI API Setup:${NC}"
        echo "1. Go to: https://platform.openai.com/"
        echo "2. Get your OpenAI API key"
        echo ""
        read -p "Enter your OpenAI API key: " openai_key
        
        # Update config with both keys
        python3 -c "
import json
import os

config_file = 'ai-assist/config.json'
with open(config_file, 'r') as f:
    config = json.load(f)

if '$claude_key':
    config['anthropic_api_key'] = '$claude_key'
if '$openai_key':
    config['openai_api_key'] = '$openai_key'

config['preferences']['default_model'] = 'claude'

with open(config_file, 'w') as f:
    json.dump(config, f, indent=2)

print('✅ Both API keys configured!')
"
        log "✅ Both API keys configured"
        ;;
        
    4)
        echo -e "${CYAN}👋 Skipping API setup. You can configure later.${NC}"
        ;;
        
    5)
        echo -e "${GREEN}🧪 Testing current configuration...${NC}"
        python3 ai-assist/kenki_assist.py "explain ls -la"
        exit 0
        ;;
        
    *)
        echo -e "${YELLOW}Invalid choice. Exiting...${NC}"
        exit 1
        ;;
esac

# Test the configuration
echo ""
echo -e "${GREEN}🧪 Testing AI Assistant...${NC}"
echo ""

# Test command explanation
echo -e "${CYAN}Testing command explanation...${NC}"
python3 ai-assist/kenki_assist.py "explain nmap -sS -p 80 192.168.1.1"

echo ""
echo -e "${CYAN}Testing natural language translation...${NC}"
python3 ai-assist/kenki_assist.py "translate scan for open ports on my network"

echo ""
echo -e "${GREEN}🎉 API Key Setup Complete!${NC}"
echo ""
echo -e "${BLUE}💡 Next Steps:${NC}"
echo "• Test interactive mode: python3 ai-assist/kenki_assist.py --interactive"
echo "• Test voice interface: python3 ai-assist/voice.py --interactive"
echo "• Build full ISO: Follow VM_SETUP_GUIDE.md"
echo ""
echo -e "${YELLOW}⚠️ Remember: Keep your API keys secure!${NC}" 
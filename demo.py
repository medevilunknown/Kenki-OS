#!/usr/bin/env python3
"""
KENKI OS Demo Script
Demonstrates the AI assistant capabilities
"""

import sys
import os
import time

# Add the ai-assist directory to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'ai-assist'))

def print_banner():
    """Print KENKI OS banner"""
    print("""
 ██ ▄█▀▄▄▄█████▓ ▒█████   ██ ▄█▀ ██▓ ██▓    
 ██▄█▒ ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒ ▓██▒▓██▒    
▓███▄░ ▒ ▓██░ ▒░▒██░  ██▒▓███▄░ ▒██▒▒██░    
▓██ █▄ ░ ▓██▓ ░ ▒██   ██░▓██ █▄ ░██░▒██░    
▒██▒ █▄░ ▒██▒ ░ ░ ████▓▒░▒██▒ █▄░██░░██████▒
▒ ▒▒ ▓▒ ░ ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░▓  ░ ▒░▓  ░
░ ░▒ ▒░ ░ ░      ░ ░ ▒ ▒░ ░ ░▒ ▒░ ▒ ░░ ░ ▒  ░
░ ░░ ░  ░ ░    ░ ░ ░ ▒  ░ ░░ ░  ▒ ░  ░ ░   
░  ░                 ░ ░  ░  ░      ░  ░    
""")
    print("🧠 KENKI OS - AI-Enhanced Security Platform")
    print("=" * 60)

def demo_command_explanation():
    """Demo command explanation"""
    print("\n🔍 Demo: Command Explanation")
    print("-" * 40)
    
    try:
        from kenki_assist import KenkiAssistant
        assistant = KenkiAssistant("ai-assist/config.json")
        
        commands = [
            "nmap -sS -p 80 192.168.1.1",
            "sqlmap -u http://target.com/page.php?id=1",
            "hydra -l admin -P wordlist.txt ssh://target.com"
        ]
        
        for cmd in commands:
            print(f"\n📝 Explaining: {cmd}")
            print("💡 Response:")
            response = assistant.explain_command(cmd)
            print(response[:500] + "..." if len(response) > 500 else response)
            time.sleep(1)
            
    except Exception as e:
        print(f"❌ Demo failed: {e}")

def demo_translation():
    """Demo natural language to shell translation"""
    print("\n🔄 Demo: Natural Language Translation")
    print("-" * 40)
    
    try:
        from kenki_assist import KenkiAssistant
        assistant = KenkiAssistant("ai-assist/config.json")
        
        requests = [
            "Find all open ports on this network",
            "Scan for SQL injection vulnerabilities",
            "Crack the password hash",
            "Analyze the memory dump for malware"
        ]
        
        for request in requests:
            print(f"\n📝 Request: {request}")
            print("💡 Shell Command:")
            response = assistant.translate_to_shell(request)
            print(response[:300] + "..." if len(response) > 300 else response)
            time.sleep(1)
            
    except Exception as e:
        print(f"❌ Demo failed: {e}")

def demo_tool_analysis():
    """Demo security tool analysis"""
    print("\n🛠️ Demo: Security Tool Analysis")
    print("-" * 40)
    
    try:
        from kenki_assist import KenkiAssistant
        assistant = KenkiAssistant("ai-assist/config.json")
        
        tools = [
            "metasploit",
            "nmap",
            "wireshark"
        ]
        
        for tool in tools:
            print(f"\n📝 Analyzing: {tool}")
            print("💡 Guidance:")
            response = assistant.analyze_security_tool(tool)
            print(response[:400] + "..." if len(response) > 400 else response)
            time.sleep(1)
            
    except Exception as e:
        print(f"❌ Demo failed: {e}")

def demo_interactive_mode():
    """Demo interactive mode"""
    print("\n💬 Demo: Interactive Mode")
    print("-" * 40)
    print("This would start an interactive session where you can:")
    print("• Ask questions about security tools")
    print("• Get command explanations")
    print("• Translate natural language to commands")
    print("• Analyze log files")
    print("\nTo try it: python ai-assist/kenki_assist.py --interactive")

def demo_voice_interface():
    """Demo voice interface"""
    print("\n🎤 Demo: Voice Interface")
    print("-" * 40)
    print("Voice commands you can try:")
    print("• 'Explain nmap'")
    print("• 'Translate find open ports'")
    print("• 'Analyze metasploit'")
    print("• 'Help'")
    print("• 'Stop'")
    print("\nTo try it: python ai-assist/voice.py --interactive")

def demo_security_tools():
    """Demo available security tools"""
    print("\n🔐 Demo: Available Security Tools")
    print("-" * 40)
    
    tool_categories = {
        "Reconnaissance": ["nmap", "amass", "theHarvester", "recon-ng"],
        "Web Testing": ["nikto", "dirb", "sqlmap", "wpscan"],
        "Password Attacks": ["hydra", "john", "hashcat"],
        "Wireless": ["aircrack-ng", "wifite", "reaver"],
        "Forensics": ["volatility", "ghidra", "radare2"],
        "Exploitation": ["metasploit", "beEF", "social-engineer-toolkit"]
    }
    
    for category, tools in tool_categories.items():
        print(f"\n📂 {category}:")
        for tool in tools:
            print(f"   • {tool}")
    
    print("\n💡 All tools are pre-installed and ready to use!")

def demo_ai_capabilities():
    """Demo AI capabilities"""
    print("\n🤖 Demo: AI Capabilities")
    print("-" * 40)
    
    capabilities = [
        "Command Explanation - Understand any Linux/security command",
        "Natural Language Translation - Convert requests to shell commands",
        "Tool Guidance - Get detailed help on security tools",
        "Log Analysis - Analyze log files for security insights",
        "Voice Interface - Hands-free operation",
        "Context Awareness - Understand security testing context",
        "Safety Validation - Check commands for dangerous patterns",
        "Alternative Suggestions - Provide multiple approaches"
    ]
    
    for i, capability in enumerate(capabilities, 1):
        print(f"{i}. {capability}")
    
    print("\n💡 All powered by Claude 4 and local LLM fallback!")

def run_demo():
    """Run the complete demo"""
    print_banner()
    
    print("🎬 Welcome to the KENKI OS Demo!")
    print("This demo showcases the AI-enhanced security platform capabilities.")
    
    demos = [
        ("Command Explanation", demo_command_explanation),
        ("Natural Language Translation", demo_translation),
        ("Security Tool Analysis", demo_tool_analysis),
        ("Available Security Tools", demo_security_tools),
        ("AI Capabilities", demo_ai_capabilities),
        ("Interactive Mode", demo_interactive_mode),
        ("Voice Interface", demo_voice_interface)
    ]
    
    for name, demo_func in demos:
        try:
            demo_func()
            print("\n" + "=" * 60)
        except KeyboardInterrupt:
            print("\n⏹️ Demo interrupted by user")
            break
        except Exception as e:
            print(f"\n❌ Demo '{name}' failed: {e}")
    
    print("\n🎉 Demo Complete!")
    print("\n🚀 Next Steps:")
    print("1. Configure your API keys: nano ai-assist/config.json")
    print("2. Test the assistant: python test_kenki.py")
    print("3. Start interactive mode: python ai-assist/kenki_assist.py -i")
    print("4. Try voice interface: python ai-assist/voice.py -i")
    print("\n🔧 Installation: sudo bash install/install.sh")
    print("\n⚠️ Remember: Use these tools responsibly and only on authorized systems!")

if __name__ == "__main__":
    run_demo() 
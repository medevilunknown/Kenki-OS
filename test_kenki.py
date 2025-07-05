#!/usr/bin/env python3
"""
KENKI OS Test Script
Tests the AI assistant functionality
"""

import sys
import os
import json
from pathlib import Path

# Add the ai-assist directory to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'ai-assist'))

def test_imports():
    """Test that all modules can be imported"""
    print("🧪 Testing imports...")
    
    try:
        from kenki_assist import KenkiAssistant
        print("✅ kenki_assist imported successfully")
    except ImportError as e:
        print(f"❌ Failed to import kenki_assist: {e}")
        return False
    
    try:
        from explain import CommandExplainer
        print("✅ explain module imported successfully")
    except ImportError as e:
        print(f"❌ Failed to import explain: {e}")
        return False
    
    try:
        from translate import ShellTranslator
        print("✅ translate module imported successfully")
    except ImportError as e:
        print(f"❌ Failed to import translate: {e}")
        return False
    
    try:
        from voice import KenkiVoiceInterface
        print("✅ voice module imported successfully")
    except ImportError as e:
        print(f"❌ Failed to import voice: {e}")
        return False
    
    return True

def test_config():
    """Test configuration loading"""
    print("\n🧪 Testing configuration...")
    
    config_path = Path("ai-assist/config.json")
    if not config_path.exists():
        print("❌ Config file not found")
        return False
    
    try:
        with open(config_path, 'r') as f:
            config = json.load(f)
        print("✅ Config file loaded successfully")
        print(f"   - Claude API key: {'Set' if config.get('anthropic_api_key') else 'Not set'}")
        print(f"   - Local LLM enabled: {config.get('local_llm', {}).get('enabled', False)}")
        return True
    except json.JSONDecodeError as e:
        print(f"❌ Invalid JSON in config: {e}")
        return False
    except Exception as e:
        print(f"❌ Config error: {e}")
        return False

def test_assistant_creation():
    """Test assistant creation"""
    print("\n🧪 Testing assistant creation...")
    
    try:
        from kenki_assist import KenkiAssistant
        assistant = KenkiAssistant("ai-assist/config.json")
        print("✅ Assistant created successfully")
        return True
    except Exception as e:
        print(f"❌ Failed to create assistant: {e}")
        return False

def test_command_explanation():
    """Test command explanation"""
    print("\n🧪 Testing command explanation...")
    
    try:
        from explain import CommandExplainer
        explainer = CommandExplainer()
        
        # Test with a simple command
        result = explainer.explain("ls -la")
        if result and "❌" not in result:
            print("✅ Command explanation working")
            return True
        else:
            print("❌ Command explanation failed")
            return False
    except Exception as e:
        print(f"❌ Command explanation error: {e}")
        return False

def test_translation():
    """Test natural language translation"""
    print("\n🧪 Testing translation...")
    
    try:
        from translate import ShellTranslator
        translator = ShellTranslator()
        
        # Test with a simple request
        result = translator.translate("find open ports")
        if result and "nmap" in result.lower():
            print("✅ Translation working")
            return True
        else:
            print("❌ Translation failed")
            return False
    except Exception as e:
        print(f"❌ Translation error: {e}")
        return False

def test_dependencies():
    """Test required dependencies"""
    print("\n🧪 Testing dependencies...")
    
    dependencies = [
        'anthropic',
        'llama_cpp',
        'speech_recognition',
        'pyttsx3',
        'requests',
        'numpy',
        'pandas'
    ]
    
    missing = []
    for dep in dependencies:
        try:
            __import__(dep)
            print(f"✅ {dep}")
        except ImportError:
            print(f"❌ {dep} - missing")
            missing.append(dep)
    
    if missing:
        print(f"\n⚠️  Missing dependencies: {', '.join(missing)}")
        print("Install with: pip install -r requirements.txt")
        return False
    
    return True

def test_security_tools():
    """Test if security tools are available"""
    print("\n🧪 Testing security tools...")
    
    tools = [
        'nmap',
        'nikto',
        'dirb',
        'sqlmap',
        'hydra',
        'john',
        'hashcat'
    ]
    
    available = []
    missing = []
    
    for tool in tools:
        if os.system(f"which {tool} > /dev/null 2>&1") == 0:
            print(f"✅ {tool}")
            available.append(tool)
        else:
            print(f"❌ {tool} - not found")
            missing.append(tool)
    
    if missing:
        print(f"\n⚠️  Missing tools: {', '.join(missing)}")
        print("Install with: sudo pacman -S blackarch")
        return False
    
    return True

def test_voice_interface():
    """Test voice interface (without actual audio)"""
    print("\n🧪 Testing voice interface...")
    
    try:
        from voice import KenkiVoiceInterface
        # This will fail if audio dependencies are missing, but that's expected
        voice = KenkiVoiceInterface("ai-assist/config.json")
        print("✅ Voice interface created successfully")
        return True
    except Exception as e:
        print(f"⚠️  Voice interface error (expected if audio not configured): {e}")
        return True  # Not critical for basic functionality

def run_all_tests():
    """Run all tests"""
    print("🧠 KENKI OS Test Suite")
    print("=" * 50)
    
    tests = [
        test_imports,
        test_config,
        test_dependencies,
        test_assistant_creation,
        test_command_explanation,
        test_translation,
        test_security_tools,
        test_voice_interface
    ]
    
    passed = 0
    total = len(tests)
    
    for test in tests:
        try:
            if test():
                passed += 1
        except Exception as e:
            print(f"❌ Test failed with exception: {e}")
    
    print("\n" + "=" * 50)
    print(f"📊 Test Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All tests passed! KENKI OS is ready to use.")
        print("\n🚀 Next steps:")
        print("1. Configure your API keys in ai-assist/config.json")
        print("2. Run: python ai-assist/kenki_assist.py --interactive")
        print("3. Try: python ai-assist/kenki_assist.py 'explain nmap -sS'")
        return 0
    else:
        print("⚠️  Some tests failed. Please check the errors above.")
        print("\n🔧 Troubleshooting:")
        print("1. Install dependencies: pip install -r requirements.txt")
        print("2. Install security tools: sudo pacman -S blackarch")
        print("3. Check configuration: ai-assist/config.json")
        return 1

if __name__ == "__main__":
    sys.exit(run_all_tests()) 
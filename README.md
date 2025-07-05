# Kenki-OS
KENKI OS – is a cutting-edge, AI-augmented Linux distribution built on top of BlackArch, designed for ethical hackers, cybersecurity researchers, and developers who want to supercharge their workflow with powerful AI-assisted terminal tools. It combines the firepower of 2,800+ BlackArch tools with an integrated AI assistant terminal 
Here’s your full `README.md` for the KENKI OS , ready to use in your GitHub project:

---

```markdown
# 🔐 KENKI OS –

>  Claude-Powered Offensive Security Linux Distribution with Offline & Cloud AI Assistants.

---

## 🧠 What is KENKI OS?

KENKI OS – TrAEL AI Edition is a next-gen, AI-augmented Linux OS based on BlackArch, designed for cybersecurity professionals, ethical hackers, and AI researchers. It fuses the raw power of over 2,800+ hacking tools from BlackArch with a smart, Claude 4-powered terminal assistant called `kenki-assist`.

Whether you’re reverse engineering, hunting malware, scanning networks, or automating recon, KENKI gives you both intelligence and infrastructure—in one place.

---

## 🚀 Features

- ✅ BlackArch Base 
  Full penetration testing, OSINT, wireless, forensics, and malware analysis tools pre-installed.

- 🧠 AI Terminal Assistant (`kenki-assist`)
  - Explain bash commands
  - Translate natural language to shell
  - Summarize logs, output, code, or malware
  - Answer real-time security questions

- 🌐 Hybrid AI Support
  - 🔗 Cloud: Claude 4 via Anthropic API
  - 🔒 Local: Llama.cpp, Mistral, Phi-2, or Ollama

- 🎙️ Voice Support (Optional)
  - Use Whisper for offline speech-to-text
  - Speak commands and hear responses

- 🖥️ Optional Warp-style GUI
  - Tauri or Electron frontend in development
  - Output blocks, command history, AI sidebar

- 🧰 Offline Ready
  - No cloud dependency — works 100% air-gapped

- 🛠️ Developer-First
  - Includes Python, Rust, Go, Git, Docker, QEMU, and more

---

## 🛠️ Tech Stack

| Layer        | Tools Used                           |
|--------------|---------------------------------------|
| Base OS      | BlackArch Linux                       |
| AI Cloud     | Claude 4 (Anthropic API)              |
| AI Local     | Llama.cpp, Ollama, Mistral, Phi       |
| Shell        | Zsh + Starship                        |
| Terminal     | Alacritty / Kitty                     |
| Voice Input  | Whisper.cpp / Vosk                    |
| GUI (opt.)   | Tauri / Textual (coming soon)         |
| ISO Builder  | ArchISO                               |

---

## 📁 Project Structure

```

kenki-os/
├── ai-assist/           # Claude and LLM CLI tools
├── local-llm/           # Llama.cpp models and config
├── gui/                 # Optional GUI (Tauri, Textual)
├── install/             # Setup scripts, themes, shell
├── archiso/             # Arch ISO builder files
├── install.sh           # Main setup script
└── README.md

````

---

## 📦 Installation

### 🧪 Live Testing

Download the ISO (or build it yourself) and boot into KENKI via:
- 🖥️ VirtualBox / QEMU / UTM
- 🧳 USB Live boot

---

### 🧰 Manual Install (for CLI assistant)

```bash
git clone https://github.com/yourusername/kenki-os.git
cd kenki-os/install
bash install.sh
````

---

## 💬 Example Usage

```bash
kenki-assist "Explain this command: awk '{print $2}' file.txt"
```

```bash
kenki-assist "Find all open ports in the 192.168.1.0/24 range"
```

```bash
kenki-assist "Summarize this network scan log: logs/nmap-result.txt"
```

---

## 👥 Who Is It For?

* Ethical hackers and red teamers
* SOC analysts and cybersecurity researchers
* AI engineers who work in security
* OS developers exploring AI + Linux integration
* Students building cybersecurity-AI prototypes

---

## 🧩 Roadmap

* [x] Claude 4 + Local AI Terminal CLI
* [ ] Tauri GUI Interface (Warp-style terminal)
* [ ] AI-enhanced log and PCAP stream analyzer
* [ ] GPT-4o fallback integration
* [ ] Plugin system for modular AI agents
* [ ] Voice-to-terminal auto actions

---

## 🤝 Contributing

We welcome:

* New AI features or prompt chains
* Shell integrations
* Claude/GPT prompt engineering
* GUI frontend improvements (Tauri / Electron)
* Model benchmarking and optimization

---

## 📄 License

MIT License – Open, free, and customizable.

---

## ✨ Credits

Created by **ROHIT(CYROS)**
Founder of the KENKI Project – where AI meets offensive security.



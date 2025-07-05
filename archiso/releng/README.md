# KENKI OS - Custom BlackArch ISO Build

This directory contains the custom `archiso` profile for building the KENKI OS ISO, based on BlackArch Linux.

## 📦 What's Included
- **BlackArch base**: All BlackArch tools and repos
- **Desktop/terminal**: XFCE, i3, Alacritty, Kitty, Zsh, Starship
- **AI assistant**: Preloaded in `/etc/kenki/ai-assist/`
- **Post-install script**: `/etc/kenki/install.sh`
- **Systemd service**: Auto-launches the AI assistant on login
- **Branding/overlays**: Ready for further customization

## 🛠️ How to Build the ISO

1. **Install archiso** (on Arch/BlackArch):
   ```bash
   sudo pacman -S archiso
   ```

2. **Build the ISO**
   ```bash
   cd archiso/releng
   sudo mkarchiso -v .
   ```
   - The output ISO will be in `out/`.

3. **Test the ISO**
   - Boot in VirtualBox, QEMU, UTM, or on real hardware.
   - After boot, your AI assistant and tools are in `/etc/kenki/`.
   - Run `/etc/kenki/install.sh` for post-install setup.

## 🧩 Directory Structure
```
archiso/releng/
├── packages.x86_64         # All packages for the ISO
├── profiledef.sh           # ISO build config and overlays
├── ai-assist-launcher.service # Systemd user service for AI assistant
├── ai-assist-overlay/      # Overlay files copied into the ISO
│   └── etc/kenki/          # AI assistant, config, install script
│       └── README.txt
└── ... (other archiso files)
```

## 📝 Customization Tips
- Add more overlays or branding in `ai-assist-overlay/`.
- Edit `packages.x86_64` to add/remove tools.
- Tweak `profiledef.sh` for advanced ISO options.
- Add a custom GRUB theme in `/boot/grub/themes/` if desired.

## 🚀 Next Steps
- Build and test your ISO!
- Share with the community or use as your personal AI hacking platform.

---

**For more info, see the main [README.md](../../README.md) and [QUICK_START.md](../../QUICK_START.md).** 
# KENKI OS GRUB Theme

This directory contains the custom GRUB theme for KENKI OS, featuring the AI-enhanced security platform branding.

## 🎨 Theme Features

- **KENKI OS branding** with custom colors
- **Security-focused design** with cyberpunk elements
- **Feature highlights** showing AI capabilities
- **Professional appearance** suitable for security professionals

## 📁 Files

- `theme.txt` - The main GRUB theme configuration
- `README.md` - This documentation file

## 🔧 Installation

### Automatic Installation
The theme is automatically installed during the ISO build process and will be available on the live system.

### Manual Installation
If you want to install the theme manually:

1. **Copy the theme files:**
   ```bash
   sudo cp -r /etc/kenki/kenki-grub-theme /boot/grub/themes/kenki
   ```

2. **Update GRUB configuration:**
   ```bash
   sudo sed -i 's/GRUB_THEME=.*/GRUB_THEME="\/boot\/grub\/themes\/kenki\/theme.txt"/' /etc/default/grub
   ```

3. **Update GRUB:**
   ```bash
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```

## 🎨 Customization

### Colors
The theme uses the KENKI OS color scheme:
- Primary: `#50fa7b` (Green)
- Secondary: `#bd93f9` (Purple)
- Accent: `#ff79c6` (Pink)
- Text: `#f8f8f2` (Light Gray)
- Background: `#1a1a1a` (Dark Gray)

### Text
You can modify the text in `theme.txt` to change:
- Main title
- Feature descriptions
- Footer message

### Layout
The theme uses a two-column layout:
- Left: Boot menu
- Right: Feature highlights

## 🔍 Troubleshooting

### Theme Not Loading
1. Check if the theme file exists: `ls /boot/grub/themes/kenki/`
2. Verify GRUB configuration: `cat /etc/default/grub | grep GRUB_THEME`
3. Rebuild GRUB: `sudo grub-mkconfig -o /boot/grub/grub.cfg`

### Font Issues
If fonts don't display correctly:
1. Install DejaVu fonts: `sudo pacman -S ttf-dejavu`
2. Update GRUB: `sudo grub-mkconfig -o /boot/grub/grub.cfg`

## 📝 Notes

- The theme is designed for 1920x1080 resolution
- Uses DejaVu Sans fonts for compatibility
- Follows GRUB theme specification v2.0
- Optimized for security professionals and ethical hackers

---

**For more information about KENKI OS, see the main documentation.** 
# 🖥️ KENKI OS - VM Setup Guide

## 🍎 **For macOS Users**

Since you're on macOS, here are the best options to run KENKI OS in a virtual machine:

---

## 🚀 **Option 1: UTM (Recommended for macOS)**

### **Step 1: Install UTM**
```bash
# Install via Homebrew
brew install --cask utm

# Or download from: https://mac.getutm.app/
```

### **Step 2: Create Arch Linux VM**
1. **Download Arch Linux ISO:**
   - Go to: https://archlinux.org/download/
   - Download the latest ISO (x86_64)

2. **Create VM in UTM:**
   - Open UTM
   - Click "Create a New Virtual Machine"
   - Choose "Virtualize"
   - Select "Linux"
   - Choose "Arch Linux"
   - Set RAM: 4GB minimum, 8GB recommended
   - Set CPU cores: 4 minimum, 8 recommended
   - Set storage: 50GB minimum
   - Mount the Arch ISO

### **Step 3: Install Arch Linux**
```bash
# Boot the VM and follow Arch installation
# Basic commands:
pacman -Syu
pacman -S base base-devel linux linux-firmware
pacman -S networkmanager sudo
systemctl enable NetworkManager
useradd -m -G wheel yourusername
passwd yourusername
visudo  # Uncomment wheel line
```

### **Step 4: Transfer KENKI OS Project**
```bash
# On your Mac, compress the project
cd /Users/rohitkunjam/Downloads/Kenki
tar -czf kenki-os-project.tar.gz .

# In UTM, enable shared folder or use scp
# Or use USB drive to transfer the file
```

### **Step 5: Build KENKI OS**
```bash
# In Arch VM
tar -xzf kenki-os-project.tar.gz
cd Kenki
sudo ./build-iso.sh
```

---

## 🚀 **Option 2: VirtualBox**

### **Step 1: Install VirtualBox**
```bash
brew install --cask virtualbox
```

### **Step 2: Create Arch VM**
- Download Arch Linux ISO
- Create new VM in VirtualBox
- Set RAM: 4GB minimum
- Set storage: 50GB minimum
- Enable PAE/NX
- Enable VT-x/AMD-V

### **Step 3: Install and Build**
Same process as UTM above.

---

## 🚀 **Option 3: VMware Fusion**

### **Step 1: Install VMware Fusion**
```bash
brew install --cask vmware-fusion
```

### **Step 2: Create VM**
- Download VMware Fusion
- Create new VM
- Choose "Install from disc or image"
- Select Arch Linux ISO
- Configure resources (4GB RAM, 4 cores, 50GB storage)

---

## 🧪 **Testing KENKI OS ISO**

Once you have the ISO built, you can test it in any VM:

### **QEMU (Built into Arch)**
```bash
# Test the ISO directly
qemu-system-x86_64 -enable-kvm -m 4G -smp 4 -boot d -cdrom kenki-os-*.iso
```

### **VirtualBox**
1. Create new VM
2. Set type: Linux, Version: Arch Linux (64-bit)
3. Set RAM: 4GB minimum
4. Create virtual hard disk: 20GB
5. Mount the KENKI OS ISO
6. Start VM

### **UTM**
1. Create new VM
2. Choose "Virtualize" → "Linux" → "Other"
3. Set resources (4GB RAM, 4 cores)
4. Mount KENKI OS ISO
5. Start VM

---

## ⚡ **Quick Test Setup**

If you want to test the AI assistant components without building the full ISO:

### **Test AI Assistant on macOS**
```bash
# Install Python dependencies
pip install -r requirements.txt

# Test the AI assistant
python ai-assist/kenki_assist.py --interactive

# Test command explanation
python ai-assist/kenki_assist.py "explain nmap -sS -p 80 192.168.1.1"
```

### **Test Voice Interface**
```bash
# Install audio dependencies
brew install portaudio

# Test voice interface
python ai-assist/voice.py --interactive
```

---

## 🔧 **VM Configuration Tips**

### **Optimal Settings**
- **RAM**: 4GB minimum, 8GB recommended
- **CPU**: 4 cores minimum, 8 cores recommended
- **Storage**: 50GB minimum for build, 20GB for testing
- **Graphics**: Enable 3D acceleration if available

### **Network Settings**
- **NAT**: For internet access during build
- **Bridged**: For network scanning tools
- **Host-only**: For isolated testing

### **Performance Tips**
- Enable VT-x/AMD-V in BIOS
- Allocate more RAM for faster builds
- Use SSD storage if possible
- Enable multiple CPU cores

---

## 🚨 **Troubleshooting**

### **Build Issues**
```bash
# Check disk space
df -h

# Check available RAM
free -h

# Reinstall archiso
sudo pacman -S --noconfirm archiso

# Clean previous builds
sudo rm -rf archiso/releng/work archiso/releng/out
```

### **VM Performance Issues**
- Increase RAM allocation
- Enable more CPU cores
- Use SSD storage
- Disable unnecessary VM features

### **Network Issues**
- Check VM network adapter settings
- Ensure NAT/bridged networking is enabled
- Test internet connectivity in VM

---

## 🎯 **Recommended Workflow**

### **For Development:**
1. Use UTM with Arch Linux VM
2. Build KENKI OS ISO in VM
3. Test ISO in same VM or different VM
4. Iterate and improve

### **For Testing:**
1. Build ISO once
2. Test in multiple VM environments
3. Document any issues
4. Share with community

---

## 📋 **Checklist**

### **Before Building:**
- [ ] Arch Linux VM installed and configured
- [ ] At least 4GB RAM allocated
- [ ] At least 50GB storage available
- [ ] Internet connection working in VM
- [ ] KENKI OS project transferred to VM

### **After Building:**
- [ ] ISO file created successfully
- [ ] ISO boots in VM
- [ ] AI assistant works
- [ ] Security tools are available
- [ ] Custom branding is applied

---

## 🎉 **Success Indicators**

You'll know it's working when:
- ✅ ISO builds without errors
- ✅ VM boots KENKI OS successfully
- ✅ AI assistant responds to commands
- ✅ Security tools are available
- ✅ Custom GRUB theme appears
- ✅ Desktop branding is applied

**Happy ethical hacking with KENKI OS! 🧠✨** 
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
  ["/etc/kenki/ai-assist/kenki_assist.py"]="0:0:755"
  ["/etc/kenki/ai-assist/explain.py"]="0:0:755"
  ["/etc/kenki/ai-assist/translate.py"]="0:0:755"
  ["/etc/kenki/ai-assist/voice.py"]="0:0:755"
  ["/etc/kenki/ai-assist/config.json"]="0:0:644"
)

# Copy custom files into the ISO
ai_assist_overlay() {
  mkdir -p "${work_dir}/ai-assist-overlay/etc/kenki/ai-assist"
  cp -r "${script_path}/../../ai-assist/"* "${work_dir}/ai-assist-overlay/etc/kenki/ai-assist/"
  cp "${script_path}/../../install/install.sh" "${work_dir}/ai-assist-overlay/etc/kenki/install.sh"
}

ai_assist_overlay
file_permissions+=( ["/etc/kenki/"]="0:0:755" )
file_permissions+=( ["/etc/kenki/ai-assist/"]="0:0:755" )
file_permissions+=( ["/etc/kenki/install.sh"]="0:0:755" ) 
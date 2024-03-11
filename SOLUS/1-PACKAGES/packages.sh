#!/bin/bash
### #!/usr/bin/env bash

# Brian Francisco
# Personal use case packages
# Feb 9 2024

#   《˘ ͜ʖ ˘》
#
#  ███████╗ ██████╗ ██╗     ██╗   ██╗███████╗    ██████╗ ██╗  ██╗ ██████╗ ███████╗
#  ██╔════╝██╔═══██╗██║     ██║   ██║██╔════╝    ██╔══██╗██║ ██╔╝██╔════╝ ██╔════╝
#  ███████╗██║   ██║██║     ██║   ██║███████╗    ██████╔╝█████╔╝ ██║  ███╗███████╗
#  ╚════██║██║   ██║██║     ██║   ██║╚════██║    ██╔═══╝ ██╔═██╗ ██║   ██║╚════██║
#  ███████║╚██████╔╝███████╗╚██████╔╝███████║    ██║     ██║  ██╗╚██████╔╝███████║
#  ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
#
# https://patorjk.com/software/taag/#p=display&c=bash&f=ANSI%20Shadow&t=Solus%20Pkgs

# install eopkg 3rd aprty
pip3 install eopkg3p

# install 3rd party apps
eopkg3p install gitkraken teamviewer

# Support for additional file systems:
filesystem_packages=(
    btrfs-progs exfatprogs f2fs-tools lvm2 reiserfsprogs udftools xfsprogs disktype ntfs-3g
)

filesystem_explanations=(
    "btrfs-progs        Tools for managing Btrfs file systems."
    "disktype           Detects the content format of a disk or disk image."
    "exfatprogs         Utilities for exFAT file system."
    "f2fs-tools         Utilities for Flash-Friendly File System (F2FS)."
    "lvm2               Logical Volume Manager 2 utilities."
    "ntfs-3g            Open source, driver for Windows NTFS file system"
    "reiserfsprogs      Tools for ReiserFS file system."
    "udftools           Tools for UDF (Universal Disk Format) file system."
    "xfsprogs           Tools for managing XFS file systems."
)

echo "The following packages will be installed:"
for ((i = 0; i < ${#filesystem_packages[@]}; i++)); do
    echo "- ${filesystem_explanations[i]}"
done

echo
read -p "Do you want to proceed with the installation? (y/n): " choice

if [[ $choice =~ ^[Yy]$ ]]; then
    echo "Installing the packages..."
    sudo eopkg install -y "${filesystem_packages[@]}"
    echo "Package installation completed."
else
    echo "Package installation skipped."
fi


############################################

sudo eopkg it -y shotwell transmission blender gimp gimp-help gimp-docs krita scribus scribus-docs telegram vlc inkscape inkscape-docs discord fastfetch variety libreoffice-all rclone rclone-browser vscode apostrophe pandoc grep ripgrep ripgrep-all meld gum kdiff3 tlp thermald


#####################################
# sudo eopkg it -y fwupd fwupd-efi
#####################################

	# Attempt to install firmware updates
#	sudo fwupdmgr get-devices
#	sudo fwupdmgr refresh --force
#	sudo fwupdmgr get-updates
#	sudo fwupdmgr update

sudo systemctl start thermald.service
sudo systemctl status thermald.service


	# Audio
	[ -f /usr/bin/easyeffects ] && [ -f $HOME/.config/easyeffects/output/default.json ] && easyeffects -l default
	[ -f /usr/bin/pulseeffects ] && [ -f $HOME/.config/PulseEffects/output/default.json ] && pulseeffects -l default

	sudo eopkg it -y packagekit dconf-editor digikam duf espeak-ng gedit gnome-font-viewer grub-customizer kate libffi-devel lsd mpg123 neofetch openssl-devel p7zip rhythmbox rygel sshpass sxiv zstd fd fzf lsd sshfs-fuse rsync openssh-server openssh wsdd virt-manager wget xclip neofetch nano btop zip un{zip,rar} tar ffmpegthumbnailer tumbler sassc font-noto-cjk gtk2-engine-murrine curl openssh libva-intel-driver intel-media-driver easyeffects pulseeffects

	# Execute rygel to start DLNA sharing
	/usr/bin/rygel-preferences

#	# Install profile-sync: it to manage browser profile(s) in tmpfs and to periodically sync back to the physical disc (HDD/SSD)
#	sudo dnf install profile-sync-daemon
#	/usr/bin/profile-sync-daemon preview
#	# sudo dnf remove profile-sync-daemon
#	# psd profile located in $HOME/.config/psd/psd.conf

	## Networking packages
	sudo eopkg it -y iptables nftables dialog

	## System utilities
	sudo eopkg it -y bash-completion busybox ca-certs gnupg screen ufw gufw vim

	## Programming and development tools
	sudo eopkg it -y autoconf automake libtool make pkg-config

	## Additional libraries and dependencies
	sudo eopkg it -y bc binutils jq libsodium libsodium-devel qrencode socat


	# Install some fonts
	display_message "[${GREEN}✔${NC}]  Installing some fonts"
	sudo eopkg it -y font-awesome-ttf powerline-fonts font-roboto-ttf
	sudo mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
	wget https://github.com/tolgaerok/fonts-tolga/raw/main/WPS-FONTS.zip
	unzip WPS-FONTS.zip -d /usr/share/fonts

	zip_file="Apple-Fonts-San-Francisco-New-York-master.zip"

	# Check if the ZIP file exists
	if [ -f "$zip_file" ]; then
		# Remove existing ZIP file
		sudo rm -f "$zip_file"
		echo "Existing ZIP file removed."
	fi

	# Download the ZIP file
	curl -LJO https://github.com/tolgaerok/Apple-Fonts-San-Francisco-New-York/archive/refs/heads/master.zip

	# Check if the download was successful
	if [ -f "$zip_file" ]; then
		# Unzip the contents to the system-wide fonts directory
		sudo unzip -o "$zip_file" -d /usr/share/fonts/

		# Update font cache
		sudo fc-cache -f -v

		# Remove the ZIP file
		rm "$zip_file"

		display_message "[${GREEN}✔${NC}] Apple fonts installed successfully."
		echo ""
		gum spin --spinner dot --title "Re-thinking... 1 sec" -- sleep 2
	else
		display_message "[${RED}✘${NC}] Download failed. Please check the URL and try again."
		gum spin --spinner dot --title "Stand-by..." -- sleep 2
	fi

	# Reloading Font
	sudo fc-cache -vf

	# Removing zip Files
	rm ./WPS-FONTS.zip
	sudo fc-cache -f -v



	sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tolgaerok/tolga-scripts/main/Fedora39/San-Francisco-family/San-Francisco-family.sh)"



	display_message "[${GREEN}✔${NC}]  Trimming all mount points on SSD"
	sudo fstrim -av



speed-up-shutdown() {
	display_message "${YELLOW}[*]${NC} Configure shutdown of units and services to 10s .."
	sleep 1

	# Configure default timeout to stop system units
	sudo mkdir -p /etc/systemd/system.conf.d
	sudo tee /etc/systemd/system.conf.d/default-timeout.conf <<EOF
[Manager]
DefaultTimeoutStopSec=10s
EOF

	# Configure default timeout to stop user units
	sudo mkdir -p /etc/systemd/user.conf.d
	sudo tee /etc/systemd/user.conf.d/default-timeout.conf <<EOF
[Manager]
DefaultTimeoutStopSec=10s
EOF

	display_message "${GREEN}[✔]${NC} Shutdown speed configured"
	gum spin --spinner dot --title "Stand-by..." -- sleep 2

}




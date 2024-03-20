#!/bin/bash
### #!/usr/bin/env bash

# Brian Francisco
# Personal use case packages
# 27 Feb 2024

#   《˘ ͜ʖ ˘》
#
#  ███████╗ ██████╗ ███████╗████████╗██╗    ██╗ █████╗ ██████╗ ███████╗    ██████╗ ██╗  ██╗ ██████╗ ███████╗
#  ██╔════╝██╔═══██╗██╔════╝╚══██╔══╝██║    ██║██╔══██╗██╔══██╗██╔════╝    ██╔══██╗██║ ██╔╝██╔════╝ ██╔════╝
#  ███████╗██║   ██║█████╗     ██║   ██║ █╗ ██║███████║██████╔╝█████╗      ██████╔╝█████╔╝ ██║  ███╗███████╗
#  ╚════██║██║   ██║██╔══╝     ██║   ██║███╗██║██╔══██║██╔══██╗██╔══╝      ██╔═══╝ ██╔═██╗ ██║   ██║╚════██║
#  ███████║╚██████╔╝██║        ██║   ╚███╔███╔╝██║  ██║██║  ██║███████╗    ██║     ██║  ██╗╚██████╔╝███████║
#  ╚══════╝ ╚═════╝ ╚═╝        ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
#
# https://patorjk.com/software/taag/#p=display&c=bash&f=ANSI%20Shadow&t=Software%20Pkgs

# Tolga Erok
# for
# Brian
# 4/3/2024

# clear



# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Installing Essential Software Packages"

sudo pacman -Sy acl akonadi akonadi-calendar-tools akonadi-calendar akonadi-import-wizard aria2 attr autoconf automake bash-completion bc binutils btop busybox ca-certificates ca-certificates-mozilla ca-certificates-utils cifs-utils cjson codec2 cowsay curl dbus-glib dconf-editor dialog direnv

sleep 1

sudo pacman -Sy duf earlyoom easyeffects espeak-ng fancontrol-gui-git fastfetch fd ffmpeg ffmpegthumbnailer ffmpegthumbs figlet flatpak fortune-mod git grsync gnupg grep grub-customizer gstreamer-vaapi gstreamer gtk-engine-murrine

sleep 1

sudo pacman -Sy gtk-engines gum haveged htop intel-media-driver iptables jq kate kdegraphics-thumbnailers libffi libfreeaptx rabbitmq librist libsodium libtool libva-intel-driver libvdpau libvdpau-va-gl libxext llvm16-libs lsd make mbedtls meld

sleep 1

sudo pacman -Sy firefox-ublock-origin merkuro mpg123 nano nano-syntax-highlighting neofetch neovim neovim-qt net-snmp net-tools nftables nsxiv openssh ostree p7zip p7zip-gui packagekit pkgconf plasma-firewall plocate powertop pulseeffects python python-pip

sleep 1

sudo pacman -Sy python-setproctitle qrencode ripgrep ripgrep-all rsync rygel sassc screen socat openssl sshpass sxiv tar terminator tlp tlp-rdw

sleep 1

sudo pacman -Sy tlpui tumbler ufw ufw-extras ugrep un{zip,rar} unrar-free variety vim virt-manager wget xclip yakuake zip zramswap zram-generator zstd

sleep 1

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Package installation completed."

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Installing Software Packages"

sudo pacman -Sy blender digikam flameshot ghostwriter gimp gimp-help-en gimp-extras inkscape kdepim-addons krita neochat rclone rclone-browser rhythmbox scribus shotwell simplescreenrecorder syncthing transmission-{cli,remote-gtk,gtk,qt} uget vlc yakuake

echo "Package installation completed."

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Installing utilites for different file system access"

sudo pacman -Sy btrfs-progs btrfs-assistant grub-btrfs btrfsmaintenance exfatprogs exfat-utils f2fs-tools hfsprogs jfsutils lvm2 nilfs-utils ntfs-3g udftools xfsprogs

echo "Package installation completed."

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

# sudo dnf install earlyoom
sudo systemctl enable --now earlyoom

# Installing fonts

sudo pacman -Sy ttf-font-awesome awesome-terminal-fonts powerline-fonts ttf-fira-code xorg-fonts-100dpi
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo unzip Meslo.zip -d /usr/share/fonts
wget https://github.com/tolgaerok/fonts-tolga/raw/main/WPS-FONTS.zip
sudo unzip WPS-FONTS.zip -d /usr/share/fonts/wps-office

# Reloading Font
sudo fc-cache -vf

# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip ./WPS-FONTS.zip

	# Install some fonts
	display_message "[${GREEN}✔${NC}]  Installing some fonts"


#	sudo dnf install -y redhat-{mono,text,display}-fonts

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

	# sudo dnf install fontconfig-font-replacements -y --skip-broken && sudo dnf install fontconfig-enhanced-defaults -y --skip-broken

	 sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tolgaerok/tolga-scripts/main/Fedora39/San-Francisco-family/San-Francisco-family.sh)"


	# Enable trim support
	sudo systemctl enable fstrim.timer
#################################################


	# Audio
	[ -f /usr/bin/easyeffects ] && [ -f $HOME/.config/easyeffects/output/default.json ] && easyeffects -l default
	[ -f /usr/bin/pulseeffects ] && [ -f $HOME/.config/PulseEffects/output/default.json ] && pulseeffects -l default

	# Configure fortune
	# If you want to display a specific fortune file or category, you can use the -e option followed by the file or category name. For example:
	# fortune -e art ascii-art bofh-excuses computers cookie definitions disclaimer drugs education fortunes humorists kernelnewbies knghtbrd law linux literature miscellaneous news people riddles science
	# or to see a list:
	# fortune -f

	# Execute rygel to start DLNA sharing
	/usr/bin/rygel-preferences

	# Install profile-sync: it to manage browser profile(s) in tmpfs and to periodically sync back to the physical disc (HDD/SSD)

	sudo pacman -Sy install profile-sync-daemon
	/usr/bin/profile-sync-daemon preview
	# sudo dnf remove profile-sync-daemon
	# psd profile located in $HOME/.config/psd/psd.conf

# Function to print text in yellow color
print_yellow() {
	echo -e "\e[93m$1\e[0m"
}

# Function to clear systemd journal logs
function clear_journal_logs() {
    sudo journalctl --vacuum-time=7d
    echo "Systemd journal logs cleared."
}

# Lets clean up
echo -e "\n\n----------------------------------------------"
echo -e "|     Let's clean up                         |"
echo -e "----------------------------------------------\n\n"
#sudo update-grub
#sudo dnf -y up
#sudo dnf -y autoremove
#sudo dnf -y clean all
clear_journal_logs
remove_residual_config_files

echo -e "\n\n----------------------------------------------"
echo -e "|     Let's clean up your SSD                 |"
echo -e "----------------------------------------------\n\n"
sudo fstrim -av

echo -e "\n\n----------------------------------------------"
echo -e "|                                            |"
echo -e "|               Setup Complete!              |"
echo -e "|          Please run ___________.sh         |"
echo -e "|    to back up your APT packages and more   |"
echo -e "|                                            |"
echo -e "----------------------------------------------\n\n"

# exit 0

# Function to check port 22
check_port22() {
	if pgrep sshd >/dev/null; then
		display_message "[${GREEN}✔${NC}] SSH service is running on port 22"
		gum spin --spinner dot --title "Stand-by..." -- sleep 2
	else
		display_message "${RED}[✘]${NC} SSH service is not running on port 22. Install and enable SSHD service.\n"
		gum spin --spinner dot --title "Stand-by..." -- sleep 2
		check_error
	fi
}

# Function to check if a service is active
is_service_active() {
	systemctl is-active "$1" &>/dev/null
}

# Function to check if a service is enabled
is_service_enabled() {
	systemctl is-enabled "$1" &>/dev/null
}


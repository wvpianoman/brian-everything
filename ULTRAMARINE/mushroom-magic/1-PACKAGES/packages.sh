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

echo "Installing RPM Fusion Repositories"

	# Install Apps
	sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	sudo dnf install rpmfusion-free-release-tainted
	sudo dnf install rpmfusion-nonfree-release-tainted
	sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Installing Essential Software Packages"

sudo dnf install -y acl akonadi akonadi-calendar-tools akonadi-import-wizard arc-kde-yakuake aria2 attr autoconf automake bash-completion bc binutils btop busybox ca-certificates cifs-utils cjson codec2 cowsay crontabs curl dbus-glib dconf-editor dialog direnv

sudo dnf install -y dnf-plugins-core dnf-utils dnfdragora dnsutils dnf5 dnf5-plugins duf earlyoom easyeffects espeak espeak-ng fancontrol-{gui,gui-kcm,gui-plasmoid} fastfetch fd-find ffmpeg ffmpeg-libs ffmpegthumbnailer ffmpegthumbs figlet flatpak fortune-mod git gnome-font-viewer

sudo dnf install -y gnupg2 google-noto-emoji-color-fonts grep grub-customizer gstreamer1-{libav,vaapi} gstreamer1-plugins-{bad-free,bad-free-extras,good,good-extras,ugly,ugly-free} gtk-murrine-engine gtk{2,3}-immodule-xim gtk2-engines haveged htop ibus-gtk4 intel-media-driver iptables iptables-services jq

sudo dnf install -y kate kate-plugins kernel-modules-extra kdegraphics-thumbnailers kdepim libavcodec-{free,freeworld} libffi libffi-devel libfreeaptx libfreeaptx-tools libgcab1 librabbitmq librabbitmq-tools librist libsodium libsodium-devel libtool libva-intel-driver libvdpau libvdpau-va-gl libXext

sudo dnf install -y llvm16-libs lpcnetfreedv lsd make materia-kde-yakuake mbedtls meld mesa-{libGL,libGLU,libd3d}-devel mesa-filesystem mesa-libEGL mesa-libGL mesa-libGL{w,U} mesa-libglapi mesa-libO{penCL,SMesa} mesa-va-drivers mesa-vulkan-drivers mozilla-ublock-origin merkuro mpg123

sudo dnf install -y nano neofetch neovim neovim-qt net-snmp net-tools nftables openssh openssh-{clients,server} ostree p7zip p7zip-gui p7zip-plugins PackageKit pandoc pip pipewire-codec-aptx pkg-config plasma-discover-{flatpak,packagekit,snap} plasma-firewall-ufw

sudo dnf install -y plocate powertop pulseeffects python3 python3-pip python3-setproctitle qrencode rclone rclone-browser ripgrep rsync rygel sassc screen socat openssl-devel sshpass sxiv tar terminator tlp tlp-rdw

sudo dnf install -y tlpi tumbler tumbler-extras ufw ufw-kde ugrep un{zip,rar} unrar-free variety vim virt-manager wget wsdd xclip xorg-x11-fonts-ISO8859-1-100dpi zip zram zram-generator zram-generator-defaults zstd

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Package installation completed."

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Installiong Software Packages"

sudo dnf install -y blender boomaga digikam flameshot ghostwriter gimp gimp-help gimp-data-extras inkscape kdepim kdepim-addons krita neochat rhythmbox scribus shotwell

sudo dnf install -y simplescreenrecorder syncthing transmission transmission-{remote-gtk,gtk,qt} uget vlc yakuake

echo "Package installation completed."

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

echo "Installing utilites for different file system access"

sudo dnf install -y apfs-fuse btrfs-progs disktype exfatprogs f2fs-tools fuse-sshfs hfsutils hfsplus-tools jfsutils lvm2 nilfs-utils ntfs-3g udftools xfsprogs

echo "Package installation completed."

sleep 3

# read -n 1 -r -s -p $'Press enter to continue...\n'

sudo dnf install earlyoom
sudo systemctl enable --now earlyoom

# Installing fonts
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig -y
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

sudo apt install fonts-font-awesome
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

	sudo dnf install -y fontawesome-fonts powerline-fonts 'google-roboto*' 'mozilla-fira*' fira-code-fonts
	sudo dnf install -y redhat-{mono,text,display}-fonts

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

	# sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tolgaerok/tolga-scripts/main/Fedora39/San-Francisco-family/San-Francisco-family.sh)"

####################################################

	# Enable trim support
	sudo systemctl enable fstrim.timer
#################################################

	# Audio
	[ -f /usr/bin/easyeffects ] && [ -f $HOME/.config/easyeffects/output/default.json ] && easyeffects -l default
	[ -f /usr/bin/pulseeffects ] && [ -f $HOME/.config/PulseEffects/output/default.json ] && pulseeffects -l default
-----------------------------------------------

	# Configure fortune
	# If you want to display a specific fortune file or category, you can use the -e option followed by the file or category name. For example:
	# fortune -e art ascii-art bofh-excuses computers cookie definitions disclaimer drugs education fortunes humorists kernelnewbies knghtbrd law linux literature miscellaneous news people riddles science
	# or to see a list:
	# fortune -f

	# Execute rygel to start DLNA sharing
	/usr/bin/rygel-preferences

	# Install profile-sync: it to manage browser profile(s) in tmpfs and to periodically sync back to the physical disc (HDD/SSD)
	sudo dnf install profile-sync-daemon
	/usr/bin/profile-sync-daemon preview
	# sudo dnf remove profile-sync-daemon
	# psd profile located in $HOME/.config/psd/psd.conf


	## Make a backup of the original sysctl.conf file
	display_message "[${GREEN}✔${NC}]  Tweaking network settings"

	cp $SYS_PATH /etc/sysctl.conf.bak

	echo
	yellow_msg 'Default sysctl.conf file Saved. Directory: /etc/sysctl.conf.bak'
	echo
	gum spin --spinner dot --title "Stand-by..." -- sleep 1


# Function to clear systemd journal logs
function clear_journal_logs() {
    sudo journalctl --vacuum-time=7d
    echo "Systemd journal logs cleared."
}

# Lets clean up
echo -e "\n\n----------------------------------------------"
echo -e "|     Let's clean up                         |"
echo -e "----------------------------------------------\n\n"
sudo update-grub
sudo dnf -y up
sudo dnf -y autoremove
sudo dnf -y clean all
clear_journal_logs
remove_residual_config_files

echo -e "\n\n----------------------------------------------"
echo -e "|     Let's clean up your SSD                 |"
echo -e "----------------------------------------------\n\n"
sudo fstrim -av

echo -e "\n\n----------------------------------------------"
echo -e "|                                            |"
echo -e "|      Setup Complete! Enjoy Ultramarine     |"
echo -e "|       Please run ___________.sh            |"
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

# Function to print text in yellow color
print_yellow() {
	echo -e "\e[93m$1\e[0m"
}

install_apps() {
	display_message "[${GREEN}✔${NC}]  Installing afew personal apps..."

	# Enable trim support
	sudo systemctl enable fstrim.timer

	# Execute rygel to start DLNA sharing
	/usr/bin/rygel-preferences

	# Install profile-sync: it to manage browser profile(s) in tmpfs and to periodically sync back to the physical disc (HDD/SSD)
	sudo dnf install profile-sync-daemon
	/usr/bin/profile-sync-daemon preview
	# sudo dnf remove profile-sync-daemon
	# psd profile located in $HOME/.config/psd/psd.conf

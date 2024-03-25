#!/bin/bash

# Add repos
 sudo zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
 sudo zypper dup --from packman --allow-vendor-change

# KDE Unstable

sudo zypper ar -fp 75 https://download.opensuse.org/repositories/KDE:/Unstable:/Qt/openSUSE_Tumbleweed/ KDE:Unstable:Qt
sudo zypper ar -fp 75 https://download.opensuse.org/repositories/KDE:/Unstable:/Frameworks/openSUSE_Factory/ KDE:Unstable:Frameworks
sudo zypper ar -fp 75 https://download.opensuse.org/repositories/KDE:/Unstable:/Applications/KDE_Unstable_Frameworks_openSUSE_Factory/ KDE:Unstable:Applications
sudo zypper ar -fp 75 https://download.opensuse.org/repositories/KDE:/Unstable:/Extra/KDE_Unstable_Frameworks_openSUSE_Factory/ KDE:Unstable:Extra
sudo zypper --gpg-auto-import-keys refresh
sudo zypper -v dup --allow-vendor-change

#KDE Stable
sudo zypper ar -cfp 90 "https://download.opensuse.org/repositories/KDE:/Frameworks5/openSUSE_Factory/" KDE:Frameworks:5
sudo zypper ar -cfp 90 "https://download.opensuse.org/repositories/KDE:/Applications/KDE_Frameworks5_openSUSE_Tumbleweed/" KDE:applications:optional
sudo zypper ar -cfp 90 "https://download.opensuse.org/repositories/KDE:/Extra/KDE_Frameworks5_openSUSE_Tumbleweed" KDE:Extra:optional
sudo zypper ar -cfp 90 "https://download.opensuse.org/repositories/KDE:/Qt6/openSUSE_Tumbleweed/" KDE:Qt6.x
sudo zypper --gpg-auto-import-keys refresh
sudo zypper -v dup --allow-vendor-change

sudo zypper ar -cfp 90 "http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed" Tumbleweed_Games
sudo zypper ar -cfp 99 "http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Tumbleweed" Tumbleweed_Fonts
sudo zypper ar -cfp 99 "https://download.opensuse.org/repositories/games:/tools/openSUSE_Tumbleweed/" Tumbleweed_Games:Tools
sudo zypper ar -cfp 99 "https://download.opensuse.org/repositories/science/openSUSE_Tumbleweed/" Science:Portal
sudo zypper ar -cfp 99 "https://download.opensuse.org/repositories/Emulators:/Wine/openSUSE_Tumbleweed/" Wine
sudo zypper ar --refresh \
    https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed \
    snappy
sudo zypper --gpg-auto-import-keys refresh
sudo zypper dup --from snappy


sudo zypper install snapd
# log out and back in
sudo systemctl enable --now snapd
systemctl enable --now snapd.apparmor


sudo zypper in -y transmission transmission-gtk transmission-qt syncthing qsyncthingtray blender krita scribus scribus-doc inkscape-extensions-scribus telegram-desktop vlc inkscape discord inxi neofetch fastfetch fastfetch-bash-completion variety libreoffice rclone rclone-bash-completion bash-completion bash-doc bash-git-prompt checkbashisms


#####################################
sudo zypper in -y fwupd discover-backend-fwupd fwupd-bash-completion fwupd-efi fwupd-doc fwupd-devel
#####################################

	# Attempt to install firmware updates
	sudo fwupdmgr get-devices
	sudo fwupdmgr refresh --force
	sudo fwupdmgr get-updates
	sudo fwupdmgr update

#####################################
#sudo zypper in -y tlp tlp-rwd powertop
#####################################

# Function to optimize battery life on lappy, in theory.... LOL
optimize_battery() {
	display_message "Optimizing battery life..."

	# Check if the battery exists
	if [ -e "/sys/class/power_supply/BAT0" ]; then
		# Install TLP and mask power-profiles-daemon
		sudo zypper in -y tlp tlp-rdw
		sudo systemctl mask power-profiles-daemon

		# Install powertop and apply auto-tune
		sudo zypper in -y powertop
		sudo powertop --auto-tune

		display_message "Battery optimization completed."
		gum spin --spinner dot --title "Stand-by..." -- sleep 2
	else
		display_message "No battery found. Skipping battery optimization."
		gum spin --spinner dot --title "Stand-by..." -- sleep 2
	fi
}

sudo zypper in https://mega.nz/linux/MEGAsync/openSUSE_Tumbleweed/x86_64/megasync-openSUSE_Tumbleweed.x86_64.rpm
#
# download teamviewer from here and double-click to install with yast
# https://download.teamviewer.com/download/linux/teamviewer-suse.x86_64.rpm




	# Audio
	[ -f /usr/bin/easyeffects ] && [ -f $HOME/.config/easyeffects/output/default.json ] && easyeffects -l default
	[ -f /usr/bin/pulseeffects ] && [ -f $HOME/.config/PulseEffects/output/default.json ] && pulseeffects -l default

	sudo zypper in -y PackageKit dconf-editor digikam direnv duf earlyoom espeak figlet gedit gimp gimp-help gimp-devel git gnome-font-viewer kate libffi-devel lsd mpg123 neofetch openssl p7zip rhythmbox rygel shotwell sshpass sxiv timeshift unrar unzip cowsay fortune sshfs rsync openssh-server openssh-clients wsdd variety virt-manager wget xclip zstd fd fzf rygel flatpak neofetch nano htop zip un{zip,rar} tar ffmpegthumbnailer tumbler sassc gtk2-engines ntfs-3g wget curl git openssh intel-media-driver easyeffects 'google-roboto*'  fira-code-fonts


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

	## Networking packages
	sudo dnf -y install iptables iptables-services nftables

	## System utilities
	sudo dnf -y install bash-completion busybox crontabs ca-certificates curl dnf-plugins-core dnf-utils gnupg2 nano screen ufw unzip vim wget zip

	## Programming and development tools
	sudo dnf -y install autoconf automake bash-completion git libtool make pkg-config

	## Additional libraries and dependencies
	sudo dnf -y install bc binutils haveged jq libsodium libsodium-devel PackageKit qrencode socat

	## Miscellaneous
	sudo dnf -y install dialog htop net-tools

	sudo dnf swap -y libavcodec-free libavcodec-freeworld --allowerasing
	sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing


	# Install some fonts
	display_message "[${GREEN}✔${NC}]  Installing some fonts"
	sudo dnf install -y fontawesome-fonts powerline-fonts
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

	sudo dnf install fontconfig-font-replacements -y --skip-broken && sudo dnf install fontconfig-enhanced-defaults -y --skip-broken

	sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tolgaerok/tolga-scripts/main/Fedora39/San-Francisco-family/San-Francisco-family.sh)"



	# Install Samba and its dependencies
	sudo dnf install samba samba-client samba-common cifs-utils samba-usershares -y

	# Enable and start SMB and NMB services
	display_message "[${GREEN}✔${NC}]  SMB && NMB services started"
	sudo systemctl enable smb.service nmb.service
	sudo systemctl start smb.service nmb.service

	# Restart SMB and NMB services (optional)
	sudo systemctl restart smb.service nmb.service

	# Configure the firewall
	display_message "[${GREEN}✔${NC}]  Firewall Configured"
	sudo firewall-cmd --add-service=samba --permanent
	sudo firewall-cmd --add-service=samba
	sudo firewall-cmd --runtime-to-permanent
	sudo firewall-cmd --reload

	# Set SELinux booleans
	display_message "[${GREEN}✔${NC}]  SELINUX parameters set "
	sudo setsebool -P samba_enable_home_dirs on
	sudo setsebool -P samba_export_all_rw on
	sudo setsebool -P smbd_anon_write 1

	# Create samba user/group
	display_message "[${GREEN}✔${NC}]  Create smb user and group"
	read -r -p "Set-up samba user & group's
" -t 2 -n 1 -s

	# Prompt for the desired username for samba
	read -p $'\n'"Enter the USERNAME to add to Samba: " sambausername

	# Prompt for the desired name for samba
	read -p $'\n'"Enter the GROUP name to add username to Samba: " sambagroup

	# Add the custom group
	sudo groupadd $sambagroup

	# ensures that a home directory is created for the user
	sudo useradd -m $sambausername

	# Add the user to the Samba user database
	sudo smbpasswd -a $sambausername

	# enable or activate the Samba user account for login
	sudo smbpasswd -e $sambausername

	# Add the user to the specified group
	sudo usermod -aG $sambagroup $sambausername

	read -r -p "
Continuing..." -t 1 -n 1 -s

	# Configure custom samba folder
	read -r -p "Create and configure custom samba folder located at /home/fedora39
" -t 2 -n 1 -s

	sudo mkdir /home/fedora39
	sudo chgrp samba /home/fedora39
	sudo chmod 770 /home/fedora39
	sudo restorecon -R /home/fedora39

	# Create the sambashares group if it doesn't exist
	sudo groupadd -r sambashares

	# Create the usershares directory and set permissions
	sudo mkdir -p /var/lib/samba/usershares
	sudo chown $username:sambashares /var/lib/samba/usershares
	sudo chmod 1770 /var/lib/samba/usershares

	# Restore SELinux context for the usershares directory
	display_message "[${GREEN}✔${NC}]  Restore SELinux for usershares folder"
	sudo restorecon -R /var/lib/samba/usershares

	# Add the user to the sambashares group
	display_message "[${GREEN}✔${NC}]  Adding user to usershares"
	sudo gpasswd sambashares -a $username

	# Add the user to the sambashares group (alternative method)
	sudo usermod -aG sambashares $username

	# Restart SMB and NMB services (optional)
	display_message "[${GREEN}✔${NC}]  Restart SMB && NMB (samba) services"
	sudo systemctl restart smb.service nmb.service



	display_message "[${GREEN}✔${NC}]  Trimming all mount points on SSD"
	sudo fstrim -av


	# List of KDE applications to check..
	apps=("akregator" "ksysguard" "kmag" "kmail"
		"kaddressbook" "konversation" "elisa-player"
		"kcolorchooser" "kmouth" "korganizer" "kmousetool" "kmahjongg"
		"kpat" "kmines" "dragonplayer" "kamoso"
		"kolourpaint" "krdc" "krfb" "kmail-account-wizard"
		"pim-data-exporter" "pim-sieve-editor" "elisa*" "kdeconnectd")

	display_message "Checking for KDE applications..."

	# Check if each application is installed
	found_apps=()
	for app in "${apps[@]}"; do
		if command -v "$app" &>/dev/null; then
			found_apps+=("$app")
		fi
	done

	# Prompt the user to uninstall found applications
	if [ ${#found_apps[@]} -gt 0 ]; then
		clear
		display_message "[${RED}✘${NC}] The following KDE applications are installed:"
		for app in "${found_apps[@]}"; do
			echo -e "  ${RED}[✘]${NC}  ${YELLOW}==>${NC}  $app"
		done

		echo ""
		read -p "Do you want to uninstall them? (y/n): " uninstall_choice
		if [ "$uninstall_choice" == "y" ]; then
			display_message "[${RED}✘${NC}] Uninstalling KDE applications..."

			# Build a string of package names
			packages_to_remove=$(
				IFS=" "
				echo "${found_apps[*]}"
			)

			sudo dnf remove $packages_to_remove

			sudo dnf remove kmail-account-wizard mbox-importer kdeconnect pim-data-exporter elisa*
			dnf clean all

			# Remove media players
			sudo dnf remove -y \
				dragon \
				elisa-player \
				kamoso

			# Remove akonadi
			# sudo dnf remove -y *akonadi*

			# Remove games
			sudo dnf remove -y \
				kmahjongg \
				kmines \
				kpat

			# Remove misc applications
			sudo dnf remove -y \
				dnfdragora \
				konversation \
				krdc \
				krfb \
				plasma-welcome

			read -p "Do you want to perform autoremove? (y/n): " autoremove_choice
			if [ "$autoremove_choice" == "y" ]; then
				sudo dnf remove kmail-account-wizard mbox-importer kdeconnect pim-data-exporter elisa*
				sudo dnf autoremove
				dnf clean all
			fi
			display_message "[${GREEN}✔${NC}]  Uninstallation completed."
		else
			display_message "[${RED}✘${NC}] No applications were uninstalled."
		fi
	else
		sudo dnf remove kmail-account-wizard mbox-importer kdeconnect pim-data-exporter elisa*
		sudo dnf autoremove
		dnf clean all
		display_message "[${GREEN}✔${NC}]  Congratulations, no KDE applications detected."
		sleep 1
	fi
}



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




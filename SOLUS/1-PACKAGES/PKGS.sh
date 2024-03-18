#!/bin/bash
### #!/usr/bin/env bash


    echo "Installing the packages..."

sudo eopkg install -y acl akonadi-import-wizard aria2 attr autoconf automake bash-completion bc binutils btop busybox perl-mozilla-ca python-certifi cjson curl dialog

sudo eopkg install -y dolphin-plugins duf easyeffects espeak-ng fd findutils ffmpeg ffmpegthumbnailer ffmpegthumbs rtl8852bu flatpak git gnupg noto-sans-ttf grep grub-customizer

sudo eopkg install -y gstreamer1.0-{libav,vaapi} gstreamer1.0-plugins-{bad,base,good,opencv,ugly} gtk-engines gtk2-engines-murrine haveged ibus-gtk4 intel-media-driver iptables jq

sudo eopkg install -y kate kdegraphics-thumbnailers kdepim kdepim-addons libavcodec-extra libffi6 libffi-devel libfreeaptx librist libsodium libsodium-devel libtool libvdpau libvdpau-va-gl libxext llvm-15 lsd make meld

sudo eopkg install -y libglu mpg123 nano neofetch neovim neovim-qt net-snmp nftables openssh-server openssh ostree p7zip packagekit pandoc pip

sudo eopkg install -y pipewire kpipewire pkg-config plocate powertop python3 python-setproctitle qrencode ripgrep ripgrep-all rsync rygel sassc screen socat sshpass sxiv

sudo eopkg install -y tar terminator thefuck tlp tumbler ufw gufw un{zip,rar} variety vim virt-manager wget httpie wsdd xclip zip zram-generator zram-generator-defaults zstd

echo "Package installation completed."
    sleep 3

##  possibly nix
#
#    net-tools

echo "Installiong Software Packages"

sudo eopkg install -y  blender gimp gimp-help gimp-docs krita inkscape inkscape-docs boomaga digikam ghostwriter flameshot kdepim-addons neochat rclone rclone-browser rhythmbox scribus scribus-docs shotwell simplescreenrecorder syncthing syncthing-gtk uget vlc yakuake

echo "Package installation completed."
    sleep 3

echo "Installing utilites for different file system access"
# Support for additional file systems:

    sudo eopkg install -y  btrfs-progs exfatprogs f2fs-tools lvm2 reiserfsprogs udftools xfsprogs disktype

echo "Installation completed."
    sleep 3

#################################################################################

# Check GPU information
gpu_info=$(lspci | grep -i 'VGA\|3D')
if [[ -z $gpu_info ]]; then
    echo "No GPU found."
    exit 1
fi

# Check GPU is present
if [[ $gpu_info =~ "AMD" ]]; then

    # Install firmware for AMD GPU
    sudo eopkg update
    sudo eopkg install -y linux-firmware xorg-driver-video-amdgpu
    echo "AMD GPU firmware installed successfully."

else
    # Install video acceleration for HD Intel i965
    sudo eopkg update
    sudo eopkg install xorg-driver-video-intel
    sudo eopkg install -y libva-intel-driver
    echo "Video acceleration drivers installed successfully."
fi

# Installing fonts
sudo eopkg install -y font-fira-ttf font-firacode-ttf
sudo eopkg install -y font-awesome-ttf noto-sans-ttf font-adobe-100dpi
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

# Function to remove residual configuration files
function remove_residual_config_files() {
    packages=$(dpkg -l | awk '/^rc/ { print $2 }')
    if [ -n "$packages" ]; then
        sudo dpkg -P $packages
        echo "Residual configuration files removed."
    else
        echo "No residual configuration files found."
    fi

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
sudo update-grub
sudo apt-get autoremove -y
sudo apt-get autoclean -y
clear_journal_logs
remove_residual_config_files

echo -e "\n\n----------------------------------------------"
echo -e "|     Let's clean up your SSD                 |"
echo -e "----------------------------------------------\n\n"
sudo fstrim -av

echo -e "\n\n----------------------------------------------"
echo -e "|                                            |"
echo -e "|        Setup Complete! Enjoy debian!       |"
echo -e "|       Please run placeholder.sh            |"
echo -e "|    to back up your APT packages and more   |"
echo -e "|                                            |"
echo -e "----------------------------------------------\n\n"

exit 0

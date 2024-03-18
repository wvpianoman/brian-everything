#!/bin/bash
### #!/usr/bin/env bash


    echo "Installing the packages..."

sudo eopkg install -y acl akonadi-import-wizard aria2 attr autoconf automake bash-completion bc binutils btop busybox perl-mozilla-ca python-certifi   curl dialog

sudo eopkg install -y dolphin-plugins duf easyeffects espeak-ng fd findutils ffmpeg ffmpegthumbnailer ffmpegthumbs rtl8852bu flatpak git gnupg noto-sans-ttf grep grub-customizer

sudo eopkg install -y gstreamer1.0-{libav,vaapi} gstreamer1.0-plugins-{bad,base,good,opencv,ugly} gtk2-engines-murrine haveged ibus-gtk4 intel-media-driver iptables jq

sudo eopkg install -y kate kdegraphics-thumbnailers kdepim kdepim-addons libavcodec-extra libffi6 libffi-devel libfreeaptx librist libsodium libsodium-devel libtool libvdpau libvdpau-va-gl libxext llvm-15 lsd make meld

sudo eopkg install -y libglu mpg123 nano neofetch neovim neovim-qt net-snmp nftables openssh-server openssh ostree p7zip packagekit pandoc pip

sudo eopkg install -y pipewire kpipewire pkg-config plasma-firewall plocate powertop python3 python3-setproctitle qrencode ripgrep ripgrep-all rsync rygel sassc screen socat sshpass sxiv

sudo apt install -y --install-recommends tar terminator thefuck tlp tumbler ufw gufp *** un{zip,rar} unrar-free variety vim virt-manager webext-ublock-origin-chromium wget wget2 wsdd xclip zip systemd-zram-generator zramswap-sysvinit-compat zram-tools zstd

echo "Package installation completed."
    sleep 3

##  possibly nix
#
# cifs-utils libcjson1 codec2 cookietool cowsay cron gir1.2-dbusglib-1.0 dconf-editor direnv dnsutils fancontrol mbpfan figlet fortune-mod fortunes fortunes-min murrine-themes uim-gtk{2.0,3} uim-gtk{2.0,3}-immodule uim-qt5 uim-qt5-immodule gtk2-engines libgc1 librabbitmq4 librabbitmq-dev libegl1-mesa mesa-va-drivers mesa-vulkan-drivers ublock-origin-doc webext-ublock-origin-firefox net-tools p7zip-full p7zip-rar plasma-discover-backend-{flatpak,fwup} tlp-rdw tlpui tumbler-plugins-extra ugrep

echo "Installiong Software Packages"

sudo eopkg install -y  blender gimp gimp-help gimp-docs krita inkscape inkscape-docs boomaga digikam ghostwriter flameshot kdepim kdepim-addons neochat rclone rclone-browser rhythmbox scribus scribus-doc shotwell simplescreenrecorder syncthing syncthing-gtk uget vlc yakuake

echo "Package installation completed."
    sleep 3

echo "Installing utilites for different file system access"
# Support for additional file systems:

    sudo eopkg install -y  btrfs-progs exfatprogs f2fs-tools lvm2 reiserfsprogs udftools xfsprogs disktype
    ( exfat-fuse hfsprogs hfsplus hfsutils jfsutils nilfs-tools reiser4progs apfs-dkms apfsprogs libfsapfs-utils libfsapfs1 )

echo "Installation completed."
    sleep 3


    # Install firmware for AMD GPU
    sudo apt update
    sudo eopkg install -y linux-firmware xorg-driver-video-amdgpu
    echo "AMD GPU firmware installed successfully."



#################################################################################

# Check GPU information
gpu_info=$(lspci | grep -i 'VGA\|3D')
if [[ -z $gpu_info ]]; then
    echo "No GPU found."
    exit 1
fi

# Check if NVIDIA GPU is present
if [[ $gpu_info =~ "NVIDIA" ]]; then
    # Check if NVIDIA drivers are already installed
    if nvidia-smi &>/dev/null; then
        read -r -p "NVIDIA drivers are already installed" -t 2 -n 1 -s
        echo "."
    else
        # Install NVIDIA drivers
        sudo apt update
        sudo apt install nvidia-driver firmware-misc-nonfree -y
        sudo apt install -y nvidia-driver
        sudo bash -c 'echo -e "blacklist nouveau\noptions nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf'

        # Path to the grub configuration file
        grub_file="/etc/default/grub"

        # Comment out the existing GRUB_CMDLINE_LINUX line
        sed -i 's/^GRUB_CMDLINE_LINUX=/#&/' "$grub_file"

        # Add the new GRUB_CMDLINE_LINUX line after the commented line
        sed -i '/^#GRUB_CMDLINE_LINUX=/a GRUB_CMDLINE_LINUX="rhgb quiet rd.driver.blacklist=nouveau"' "$grub_file"

        sudo update-grub

        echo "NVIDIA drivers installed successfully."

        # Run NVIDIA settings
        sudo nvidia-settings
    fi

elif [[ $gpu_info =~ "AMD" ]]; then
    # Install firmware for AMD GPU
    sudo apt update
    sudo apt install firmware-amd-graphics -y
    echo "AMD GPU firmware installed successfully."

else
    # Install video acceleration for HD Intel i965
    sudo apt update
    sudo apt install xserver-xorg-video-intel
    sudo apt install -y i965-va-driver libva-drm2 libva-x11-2 vainfo
    echo "Video acceleration drivers installed successfully."
fi

# Installing fonts
sudo apt install fonts-font-awesome fonts-noto-color-emoji xfonts-100dpi
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

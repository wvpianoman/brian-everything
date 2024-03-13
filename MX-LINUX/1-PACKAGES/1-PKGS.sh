#!/bin/bash
### #!/usr/bin/env bash

# Brian Francisco
# Personal use case packages
# Jan 20 2024

#   《˘ ͜ʖ ˘》
#
#  ███╗   ███╗██╗  ██╗    ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗    ██████╗ ██╗  ██╗ ██████╗ ███████╗
#  ████╗ ████║╚██╗██╔╝    ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝    ██╔══██╗██║ ██╔╝██╔════╝ ██╔════╝
#  ██╔████╔██║ ╚███╔╝     ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝     ██████╔╝█████╔╝ ██║  ███╗███████╗
#  ██║╚██╔╝██║ ██╔██╗     ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗     ██╔═══╝ ██╔═██╗ ██║   ██║╚════██║
#  ██║ ╚═╝ ██║██╔╝ ██╗    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗    ██║     ██║  ██╗╚██████╔╝███████║
#  ╚═╝     ╚═╝╚═╝  ╚═╝    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
#
#https://patorjk.com/software/taag/#p=display&c=bash&f=ANSI%20Shadow&t=MX%20Linux%20Pkgs

# Install some software:

    echo "Installing the packages..."

sudo apt install -y --install-recommends acl akonadi akonadi-calendar-tools akonadi-import-wizard aria2 attr autoconf automake bash-completion bc binutils btop busybox ca-certificates cifs-utils cjson codec2 cowsay crontabs curl dbus-glib dconf-editor dialog direnv

sudo apt install -y --install-recommends dnsutils dolphin-plugins duf earlyoom easyeffects espeak espeak-ng fancontrol mbpfan fd-find ffmpeg ffmpeg-libs ffmpegthumbnailer ffmpegthumbs figlet flatpak fortune-mod git gnome-font-viewer

sudo apt install -y --install-recommends gnupg2 google-noto-emoji-color-fonts grep grub-customizer gstreamer1-{libav,vaapi} gstreamer1-plugins-{bad-free,bad-free-extras,good,good-extras,ugly,ugly-free} gtk-murrine-engine gtk{2,3}-immodule-xim gtk2-engines haveged htop ibus-gtk4 intel-media-driver iptables iptables-services jq

sudo apt install -y --install-recommends kate kdegraphics-thumbnailers kdepim libavcodec-{free,freeworld} libffi libffi-devel libfreeaptx libfreeaptx-tools libgcab1 librabbitmq librabbitmq-tools librist libsodium libsodium-devel libtool libva-intel-driver libvdpau libvdpau-va-gl libXext

sudo apt install -y --install-recommends llvm16-libs lpcnetfreedv lsd make materia-kde-yakuake mbedtls meld mesa-{libGL,libGLU,libd3d}-devel mesa-filesystem mesa-libEGL mesa-libGL mesa-libGL{w,U} mesa-libglapi mesa-libO{penCL,SMesa} mesa-va-drivers mesa-vulkan-drivers ublock-origin-doc webext-ublock-origin-firefox mpg123

sudo apt install -y --install-recommends nano neofetch neovim neovim-qt snmpd net-tools nftables openssh-{client,server} ostree p7zip p7zip-full p7zip-rar packagekit pandoc pip pipewire-audio pipewire-doc pkg-config plasma-discover-backend-{flatpak,fwupd} plasma-firewall

sudo apt install -y --install-recommends plocate powertop pulseeffects python3 python3-pip python3-setproctitle qrencode rclone rclone-browser ripgrep rsync rygel sassc screen socat sshpass sxiv tar terminator tlp tlp-rdw

sudo apt install -y --install-recommends tlpui tumbler tumbler-plugins-extras ufw ugrep un{zip,rar} unrar-free variety vim virt-manager wget wsdd xclip xfonts-100dpi zip systemd-zram-generator zramswap-sysvinit-compat zram-tools zram-generator-defaults zstd

echo "Package installation completed."
    sleep 3


#Install gum : A tool for glamorous shell scripts. https://github.com/charmbracelet/gum
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum

sudo apt install earlyoom
sudo systemctl enable --now earlyoom

echo "Installiong Software Packages"

sudo apt install -y --install-recommends blender blender-data gimp gimp-help-en krita inkscape boomaga digikam flameshot kdepim kdepim-addons neochat rhythmbox scribus scribus-doc scribus-template shotwell simplescreenrecorder syncthing syncthing-gtk transmission transmission-{remote-gtk,gtk,qt} telegram-desktop uget vlc yakuake

echo "Package installation completed."
    sleep 3

echo "Installing utilites for different file system access"
# Support for additional file systems:

    sudo apt install -y --install-recommends btrfs-progs exfatprogs f2fs-tools hfsprogs hfsplus hfsutils jfsutils lvm2 nilfs-tools reiserfsprogs reiser4progs udftools xfsprogs disktype apfs-dkms apfsprogs libfsapfs-utils libfsapfs1 exfat-fuse

echo "Installation completed."
    sleep 3


    # Install firmware for AMD GPU
    sudo apt update
    sudo apt install firmware-amd-graphics -y
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

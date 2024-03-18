#!/usr/bin/env bash

# Brian Francisco

#  ███╗   ██╗██╗██╗  ██╗     ██████╗ ██╗  ██╗ ██████╗ ███████╗
#  ████╗  ██║██║╚██╗██╔╝     ██╔══██╗██║ ██╔╝██╔════╝ ██╔════╝
#  ██╔██╗ ██║██║ ╚███╔╝█████╗██████╔╝█████╔╝ ██║  ███╗███████╗
#  ██║╚██╗██║██║ ██╔██╗╚════╝██╔═══╝ ██╔═██╗ ██║   ██║╚════██║
#  ██║ ╚████║██║██╔╝ ██╗     ██║     ██║  ██╗╚██████╔╝███████║
#  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
#
# https://patorjk.com/software/taag/#p=display&c=bash&f=ANSI%20Shadow&t=Nix-Pkgs

nix-env -iA nixpkgs.apfs-fuse
nix-env -iA nixpkgs.cowsay
nix-env -iA nixpkgs.direnv
nix-env -iA nixpkgs.fanctl
nix-env -iA nixpkgs.figlet
nix-env -iA nixpkgs.fortune
nix-env -iA nixpkgs.gum
nix-env -iA nixpkgs.haveged
nix-env -iA nixpkgs.codec2
nix-env -iA nixpkgs.uim
nix-env -iA nixpkgs.gtk-engine-murrine
nix-env -iA nixpkgs.mbpfan
nix-env -iA nixpkgs.p7zip



# google-noto-{cjk,emoji-color}-fonts
# mozilla-ublock-origin
#nix-env -iA nixpkgs.profile-sync-daemon

# fira-code-fonts
# mozilla-fira*

# iptables-services
# crontabs
#nix-env -iA nixpkgs.dnf-plugins-core
# dnf-utils
#nix-env -iA nixpkgs.nettools
# libavcodec-free
#nix-env -iA nixpkgs.haveged

#nix-env -iA nixpkgs.samba4Full  # samba-client
                                # samba-common
                                # samba-usershares

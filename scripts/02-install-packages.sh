#!/bin/bash

set -ouex pipefail

# Packages
dnf5 copr enable -y swayfx/swayfx
dnf5 copr enable -y ublue-os/packages
dnf5 copr enable -y ublue-os/staging

programming_packages=(
  "gparted"
  "fastfetch"
  "ublue-brew"
  "ptyxis"
)

utility_packages=(
  "swayfx"
  "fuzzel"
  "i3blocks"
  "jetbrains-mono-fonts-all"
  "tailscale"
)

dnf_packages=(
  ${programming_packages[@]}
  ${utility_packages[@]}
)

# install rpms
dnf5 install -y ${dnf_packages[@]} --skip-unavailable
# install fzf-tab-completion

# git clone https://github.com/lincheney/fzf-tab-completion.git /usr/share/ublue-os/fzf-tab-completion

dnf5 copr disable -y swayfx/swayfx
dnf5 copr disable -y ublue-os/packages
dnf5 copr disable -y ublue-os/staging






# brew_packages=(
#   "btop"
#   "dysk"
#   "dust"
#   "ffmpeg"
#   "fzf"
#   "broot"
# )
# 
# brew install ${brew_packages[@]}

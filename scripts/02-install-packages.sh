#!/bin/bash

set -ouex pipefail

# Packages
dnf5 copr enable -y swayfx/swayfx
dnf5 copr enable -y ublue-os/packages
dnf5 copr enable -y ublue-os/staging

dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf config-manager setopt tailscale-stable.enabled=0
dnf -y install --enablerepo='tailscale-stable' tailscale

core_packages=(
  "gparted"
  "ublue-brew"
  "ptyxis"
  "ublue-motd"
  "uupd"
)

utility_packages=(
  "swayfx"
  "fuzzel"
  "i3blocks"
  "nemo"
  "gnome-disk-utility"
  "jetbrains-mono-fonts-all"
)

dnf_packages=(
  ${programming_packages[@]}
  ${utility_packages[@]}
)

# install rpms
dnf5 install -y ${dnf_packages[@]} --skip-unavailable --install_weak_deps=false
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

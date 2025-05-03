#!/bin/bash

set -ouex pipefail

# Packages
dnf5 copr enable -y swayfx/swayfx
dnf5 copr enable -y ublue-os/packages
dnf5 copr enable -y ublue-os/staging
dnf5 -y remove sway

programming_packages=(
  "gparted"
  "fastfetch"
  "ublue-brew"
  "android-tools"
  "ptyxis"
)

utility_packages=(
  "swayfx"
  "fuzzel"
  "i3blocks"
  "jetbrains-mono-fonts-all"
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


dnf5 config-manager --add-repo "https://packages.microsoft.com/yumrepos/vscode"
dnf5 config-manager --set-disabled packages.microsoft.com_yumrepos_vscode
dnf5 -y --enablerepo packages.microsoft.com_yumrepos_vscode --nogpgcheck  install code

dnf5 config-manager --add-repo "https://download.docker.com/linux/centos/docker-ce.repo"
dnf5 config-manager --set-disabled docker-ce-stable
dnf5 -y --enablerepo docker-ce-stable install \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-buildx-plugin \
	docker-compose-plugin




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

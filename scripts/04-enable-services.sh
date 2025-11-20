#!/bin/bash

set -ouex pipefail

systemctl enable podman.socket
systemctl --global enable bazaar.service
systemctl enable brew-setup.service
systemctl enable brew-upgrade.timer
systemctl enable brew-update.timer
systemctl enable rpm-ostree-countme.service
systemctl enable tailscaled.service
systemctl enable uupd.timer
systemctl enable sddm.service

systemctl disable rpm-ostreed-automatic.timer
systemctl disable flatpak-system-update.timer


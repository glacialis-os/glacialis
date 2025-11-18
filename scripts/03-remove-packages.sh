#!/bin/bash

set -ouex pipefail

# Packages

programming_packages=(
  "foot"
  "dmenu"
  "evolution-ews-core"
  "gnome-tour"
  "malcontent-control"
  "qadwaitadecorations-qt5"
)

packages=(
  ${programming_packages[@]}
)

# install rpms
dnf5 remove -y ${packages[@]}

#!/bin/bash

set -ouex pipefail

# Packages

programming_packages=(
  "foot"
  "dmenu"
)

packages=(
  ${programming_packages[@]}
)

# install rpms
dnf5 remove -y ${packages[@]}

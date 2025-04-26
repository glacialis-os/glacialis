set ${SET_X:+-x} -eou pipefail

gnome_packages=(
  "gnome-shell"
  "gdm"
  "gnome-control-center"
)

misc_packages=(
  "foot"
  "dmenu"
)

packages=(
  ${gnome_packages[@]}
  ${misc_packages[@]}
)

dnf5 remove -y ${packages[@]}

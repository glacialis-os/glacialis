set ${SET_X:+-x} -eou pipefail

dnf5 copr enable -y swayfx/swayfx

misc_packages=(
  "sddm"

sway_packages=(
  "i3blocks"
  "swayfx"
  "fuzzel"
)

dnf_packages=(
  ${sway_packages[@]}
  ${misc_packages[@]}
)

#install rpm
dnf5 install -y ${dnf_packages[@]} --skip-unavailable



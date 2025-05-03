 #!/bin/bash


set -ouex pipefail

dnf5 config-manager addrepo --from-repofile=https://packages.microsoft.com/yumrepos/vscode/config.repo

dnf5 -y --nogpgcheck  install code

dnf5 -y config-manager addrepo --from-repofile=https://download.docker.com/linux/centos/docker-ce.repo
dnf5 -y install \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-buildx-plugin \
	docker-compose-plugin
	
dnf5 -y install android-tools

systemctl enable docker.socket

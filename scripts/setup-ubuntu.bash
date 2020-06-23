#!/usr/bin/env bash

set -euo pipefail

# install from apt
sudo apt install git curl tar apt-transport-https gnome-tweaks -y

# VSCode
sudo snap install code --classic

# Gitkraken
# Fix Gitkraken snap launcher icon
sudo snap install gitkraken
gitkraken_icon_path="Icon=/snap/gitkraken/current/usr/share/gitkraken/gitkraken.png"
gitkraken_snap_path="/var/lib/snapd/desktop/applications/gitkraken_gitkraken.desktop"
if ! grep -q "${gitkraken_icon_path}" "${gitkraken_snap_path}"; then
	printf "\n%s" "${gitkraken_icon_path}" >>"${gitkraken_snap_path}"
fi

# Chat apps
sudo snap install discord
sudo snap install slack --classic
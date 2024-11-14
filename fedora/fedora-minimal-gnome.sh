#!/bin/env bash
##### CHECK FOR SUDO or ROOT ##################################
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi

# Install Gnome Packages
dnf install \
  gdm \
  gnome-shell \
  gnome-console \
  nautilus \
  gnome-calculator \
  gnome-disk-utility \
  gnome-system-monitor \
  cups \
  gnome-software \
  gnome-tweaks \
  evince \
  gedit \
  file-roller \
  firefox \
  fuse \
  bash-completion \
  htop \
  libreoffice \
  libreoffice-gtk3 \
  fastfetch \
  @development-tools
  
systemctl enable gdm.service
systemctl set-default graphical.target

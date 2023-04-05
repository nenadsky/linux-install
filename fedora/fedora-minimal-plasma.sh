#!/bin/env bash
##### CHECK FOR SUDO or ROOT ##################################
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi

# Install KDE Packages
dnf install \
  sddm \
  plasma-desktop \
  plasma-discover \
  plasma-systemmonitor \
  sddm-kcm \
  kde-partitionmanager \
  cups \
  kde-print-manager \
  dolphin \
  konsole5 \
  okular \
  gwenview \
  spectacle \
  kate \
  ark \
  fuse \
  bash-completion \
  htop \
  neofetch
  
systemctl enable sddm
systemctl set-default graphical.target
  

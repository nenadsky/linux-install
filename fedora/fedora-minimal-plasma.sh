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
  plasma-discover-notifier \
  plasma-discover-packagekit \
  plasma-discover-flatpak \
  plasma-systemmonitor \
  sddm-kcm \
  kde-partitionmanager \
  plasma-nm \
  cups \
  kde-print-manager \
  dolphin \
  konsole \
  okular \
  gwenview \
  spectacle \
  kate \
  ark \
  firefox \
  fuse \
  bash-completion \
  dnf-plugins-core \
  tkdnd \
  htop \
  libreoffice \
  libreoffice-kf6 \
  fastfetch \
  --setopt=install_weak_deps=False
  
systemctl enable sddm.service
systemctl set-default graphical.target
  

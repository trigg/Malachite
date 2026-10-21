#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y ublue-os/bazzite

dnf5 install -y \
  sddm \
  papirus-icon-theme \
  swayidle \
  mate-polkit \
  mako \
  atkinson-hyperlegible-next-fonts \
  atkinson-hyperlegible-mono-fonts \
  qt5-qtstyleplugins \
  qt6ct \
  flatpak-libs \
  nemo \
  nemo-fileroller \
  nemo-preview \
  nemo-image-converter \
  gvfs-fuse \
  gvfs-smb \
  gvfs-gphoto2 \
  xfce4-terminal \
  loupe \
  clapper \
  gnome-text-editor \
  galculator \
  xarchiver \
  xfce4-taskmanager \
  pavucontrol \
  wdisplays \
  evince \
  file-roller \
  grim \
  slurp \
  NetworkManager-tui \
  enchant2 \
  hunspell \
  hunspell-en \
  mate-user-admin \
  wlroots \
  gtk4-layer-shell \
  librsvg2 \
  google-noto-emoji-color-fonts \
  google-noto-sans-cjk-vf-fonts \
  yyjson \
  dbus-tools \
  blueman \
  blueman-nemo \
  qt6-qtvirtualkeyboard \
  sddm-wayland-generic \
  sddm-themes \
  xdg-desktop-portal \
  xdg-desktop-portal-wlr \
  xdg-desktop-portal-gtk \
  wayland-logout \
  steam

dnf5 clean all
systemctl enable sddm

sed -i 's/^OnlyShowIn=\(.*\)/OnlyShowIn=\1Wayfire;wayfire;/' /usr/share/applications/mate-user-admin.desktop

#/bin/bash

dnf5 install -y \
      sddm papirus-icon-theme swayidle mate-polkit mako \
      atkinson-hyperlegible-next-fonts atkinson-hyperlegible-mono-fonts \
      qt5-qtstyleplugins qt6ct \
      nemo nemo-fileroller nemo-preview nemo-image-converter \
      gvfs-fuse gvfs-smb gvfs-gphoto2 xfce4-terminal \
      loupe clapper gnome-text-editor \
      galculator xarchiver xfce4-taskmanager pavucontrol wdisplays \
      chromium evince file-roller grim slurp NetworkManager-tui \
      enchant2 hunspell hunspell-en \
      wlroots gtk4-layer-shell librsvg2 google-noto-emoji-color-fonts\
      google-noto-sans-cjk-vf-fonts mesa-dri-drivers  xorg-x11-server-Xorg \
      xorg-x11-xinit
      
dnf5 clean all

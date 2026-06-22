FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

# Base Image
FROM ghcr.io/ublue-os/base-main:latest

RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
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
      xorg-x11-xinit yyjson dbus-tools blueman blueman-nemo qt6-qtvirtualkeyboard  \
      sddm-wayland-generic sddm-themes \
      && dnf5 clean all

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint

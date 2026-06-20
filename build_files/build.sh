#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

dnf5 install -y \
  meson ninja-build gcc-c++ git nodejs npm cmake \
  python3-pip python3-setuptools \
  libdrm-devel mesa-libgbm-devel mesa-libEGL-devel mesa-libGLES-devel \
  libglvnd-devel pixman-devel libdecor-devel wayland-devel wayland-protocols-devel \
  libxkbcommon-devel libinput-devel libevdev-devel libseat-devel glm-devel libxml2-devel \
  gtk3-devel gtk4-devel gtkmm4.0-devel cairo-devel pango-devel libdbusmenu-gtk3-devel \
  NetworkManager-libnm-devel libjpeg-turbo-devel libpng-devel pipewire-devel alsa-lib-devel \
  pulseaudio-libs-devel systemd-devel wlroots-devel enchant2-devel \
  pam-devel gobject-introspection-devel vala yyjson-devel openssl-devel \
  gtk4-layer-shell-devel librsvg2-devel

mkdir -p /tmp/wayfire-build
cd /tmp/wayfire-build

git clone --recurse-submodules https://github.com/WayfireWM/wayfire.git
git clone --recurse-submodules https://github.com/WayfireWM/wf-shell.git
git clone --recurse-submodules https://github.com/soreau/wf-copy-capture.git
git clone --recurse-submodules https://github.com/soreau/pixdecor.git
git clone https://github.com/trigg/touchswitch.git
git clone https://github.com/trigg/orientprompt.git
git clone https://github.com/trigg/materia-trigg-custom.git

cd "wayfire"
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Duse_system_wlroots=enabled \
  -Duse_system_wfconfig=disabled \
  -Db_lto=true \
  -Db_pie=true \
  -Dtests=disabled \
  -Dwf-config:tests=disabled 
ninja -C build
ninja -C build install 
cd -

dirs=("wf-shell" "wf-copy-capture" "pixdecor" "touchswitch" "materia-trigg-custom" "orientprompt")

for dir in "${dirs[@]}"; do
    cd "$dir"
    if [ "$dir" = "materia-trigg-custom" ]; then
      HOME=/tmp npm install sass
    fi
    meson setup build --prefix=/usr --buildtype=release -Db_lto=true -Db_pie=true
    ninja -C build
    ninja -C build install 
    cd -
done

dnf5 remove -y \
  meson ninja-build gcc-c++ git nodejs npm cmake \
  python3-pip python3-setuptools \
  vala \
  *-devel

systemctl enable sddm

dnf5 clean all
rm -rf /tmp/wayfire-build

name="timeshift"
repology=("project: timeshift")
pkgver="23.07.1"
pkgrel="2"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
url="https://github.com/linuxmint/timeshift/archive/refs/tags/${pkgver}.zip"
hash="7b468430198c4e8c5c502258f1f67d15f0e68c3f58189d6e80b661cbdaf740f2"
makedepends=("debhelper" "autotools-dev" "gzip" "valac" "libgtk-3-dev" "libgee-0.8-dev" "libjson-glib-dev" "libvte-2.91-dev" "libxapp-dev" "meson" "ninja-build" "help2man")
depends=("rsync" "btrfs-progs")
breaks=("${name}-git" "${name}-deb" "${name}-bin" "${name}-app")
replace=("timeshift-btrfs")
pkgdesc="System restore utility that takes snapshots at regular intervals using rsync or BTRFS."

build() {
  sudo meson setup build
  sudo ninja -C build -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}

# FIX: workaround broken pkexec usage from upstream
post_install() {
  sudo sed -i 's/pkexec \${app/pkexec env DISPLAY=\$DISPLAY XAUTHORITY=\$XAUTHORITY \${app/g' /usr/local/bin/timeshift-launcher
}

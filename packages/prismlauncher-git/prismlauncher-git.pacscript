name="prismlauncher-git"
gives="prismlauncher"
url="https://github.com/PrismLauncher/PrismLauncher.git"
pkgver="7.2"
makedepends=("qtbase5-dev" "qtchooser" "qt5-qmake" "qtbase5-dev-tools" "libqt5core5a" "libqt5network5" "libqt5gui5" "cmake" "ninja-build" "extra-cmake-modules" "zlib1g-dev" "openjdk-17-jdk" "libgl1-mesa-dev" "scdoc")
pkgdesc="Custom launcher for Minecraft"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" develop | cut -f1 | cut -c1-8
}

prepare() {
  git submodule update --init --recursive
}

build() {
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_LTO=ON

  cmake --build build
}

package() {
  sudo DESTDIR="${pkgdir}" cmake --install build
}

name="cutefish-kwin-plugins-git"
gives="cutefish-kwin-plugins"
pkgver="0.8"
url="https://github.com/cutefishos/kwin-plugins.git"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("libkf5config-dev" "libkdecorations2-dev" "libkf5guiaddons-dev" "libkf5coreaddons-dev" "libkf5configwidgets-dev" "libkf5windowsystem-dev" "libkf5wayland-dev" "kwin-dev")
pkgdesc="CutefishOS KWin Plugins."
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd build
  sudo make install DESTDIR="${pkgdir}"
}

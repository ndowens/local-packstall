name="intel-undervolt"
pkgver="1.7"
url="https://github.com/kitsunyan/intel-undervolt/archive/refs/tags/${pkgver}.tar.gz"
hash="29a7ebaee4830d65d0b5cefa6d497887d4f23f34659876dfe944f3a020cf33ff"
makedepends=("pkg-config")
maintainer="Elsie19 <elsie19@pm.me>"
pkgdesc="Tool for undervolting and throttling limits alteration for Intel CPUs"

prepare() {
  # other flags are '--enable-systemd', '--enable-slogind', '--enable-openrc'
  ./configure
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

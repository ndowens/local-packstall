name="i3blocks-git"
pkgname="i3blocks"
pkgdesc="A feed generator for text based status bars"
url="https://github.com/vivien/${pkgname}.git"
pkgver="1.5"
makedepends=("autoconf" "gcc" "make" "pkgconf")
breaks=("${pkgname}")
maintainer="Lanius <laniusone@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  ./autogen.sh && ./configure
}

build() {
  make -j"${NCPU}"
}

package() {
  # Install i3blocks
  sudo make install DESTDIR="${pkgdir}"
}

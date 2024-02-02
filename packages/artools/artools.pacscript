name="artools"
arch=('amd64')
pkgver="0.32.3"
pkgrel="1"
pkgdesc="Artix's packaging tools"
homepage="gitea.artixlinux.org/artix/artools"
url="https://gitea.artixlinux.org/artix/artools/archive/$pkgver.tar.gz"
makedepends=("gcc")
depends=("pacman-package-manager" "makepkg" "colorize")

build() {
    make PREFIX=/usr
  }

package() {
    sudo make PREFIX=/usr DESTDIR="$pkgdir" install
  }

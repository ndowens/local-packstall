name="artix-checkupdates"
pkgver="0.8.3"
pkgrel="1"
pkgdesc="Script to check for updates from Archlinux"
arch=("amd64")
url="https://gitea.artixlinux.org/artix/artix-checkupdates/archive/$pkgver.tar.gz"
makedepends=('libalpm-dev' 'libarchive-dev')
depends=("brotli" "curl" "acl" "openssl" "libunistring5" "pacman-package-manager")

build() {
    make
  }

package() {
    sudo make DESTDIR="$pkgdir" install
  }

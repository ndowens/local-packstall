name="pb-git"
pkgver="2022.11.03"
pkgdesc="0x0 pastebin utility"
maintainer="vigress8 <vig@disroot.org>"
url="https://git.envs.net/envs/pb.git"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

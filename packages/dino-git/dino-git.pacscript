name="dino-git"
url="https://github.com/Elsie19/Dino.git"
pkgver="0.1.1"
breaks=("dino" "dino-app" "dino-bin" "dino-deb")
gives="dino"
pkgdesc="An extensible database system written in Bash"
maintainer="Elsie19 <elsie19@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo install -Dm755 dino "${pkgdir}/usr/bin/dino"
  sudo install -D programs/* -t "${pkgdir}/usr/share/dino/programs"
  sudo install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}

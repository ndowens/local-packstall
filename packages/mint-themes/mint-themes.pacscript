name="mint-themes"
pkgver=2.1.5
repology=("project: mint-themes")
url="http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_${pkgver}.tar.xz"
pkgdesc="GTK 2, 3, and 4 themes from Linux Mint, for use with Cinammon, MATE, and Xfce."
hash="685cff6598bdaf4b6813be3080368845f019e09e974e7f589b5f99acb3da2396"
repology=("project: ${gives}")
maintainer="badlydrawnface <bdface@proton.me>"
makedepends=("python3" "sassc")
optdepends=(
  "mint-y-icons: Complementary icons for Mint-Y themes."
  "mint-x-icons: Complementary icons for Mint-X themes."
)

build() {
  make clean
  make -j"${NCPU}"
}

package() {
  sudo cp -r usr "${pkgdir}/"
}

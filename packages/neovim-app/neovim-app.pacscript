name="neovim-app"
gives="neovim"
replace=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.9.5"
makedepends=("libfuse2")
depends=("libfuse2")
url="https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage"
homepage='https://neovim.io/'
hash="0c82e5702af7a11fbb916a11b4a82e98928abf8266c74b2030ea740340437bf9"
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo chmod +x nvim.appimage
  sudo install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}

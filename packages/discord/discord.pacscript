name="discord"
pkgver="0.0.41"
maintainer="Elsie19 <elsie19@pm.me>"
url="https://dl.discordapp.net/apps/linux/${pkgver}/${name}-${pkgver}.tar.gz"
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
hash="cb308e958203bdb84945b8aa7f9342da2053d9ece524ff353bfc2d916204a7e5"
arch=('amd64')
repology=("project: ${name}")

prepare() {
  sudo mkdir -p "${pkgdir}/usr/share/discord/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/icons/"
}

package() {
  sudo install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  sudo install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
  sudo cp -R ./* "${pkgdir}/usr/share/discord/"
}

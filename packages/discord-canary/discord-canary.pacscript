name="discord-canary"
repology=("project: discord-canary")
pkgver="0.0.267"
maintainer="DismissedGuy <me@mikealmel.ooo>"
url="https://dl-canary.discordapp.net/apps/linux/${pkgver}/${name}-${pkgver}.tar.gz"
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libc++1" "libatk1.0-0" "libatk-bridge2.0-0" "libcups2" "libdrm2" "libgtk-3-0" "libgbm1")
pkgdesc="Chat for Communities and Friends - Unstable"
arch=('amd64')
hash="1eaefc4837abec66fe8eef3093d0eb30b8ac1e7a18a12c13cebb3c3ca85b4b7b"

prepare() {
  sudo mkdir -p "${pkgdir}/usr/share/${name}/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/icons/"
}

package() {
  sudo install -Dm755 discord-canary.desktop "${pkgdir}/usr/share/applications/discord-canary.desktop"
  sudo install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord-canary.png"
  sudo cp -R ./* "${pkgdir}/usr/share/${name}/"
}

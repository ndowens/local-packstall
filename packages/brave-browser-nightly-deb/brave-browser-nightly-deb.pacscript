name="brave-browser-nightly-deb"
pkgver="1.64.21"
gives="brave-browser-nightly"
breaks=("${gives}-bin" "${gives}-app" "${gives}-git")
replace=("${gives}")
pacdeps=("brave-keyring-deb")
url="https://github.com/brave/brave-browser/releases/download/v${pkgver}/${gives}_${pkgver}_amd64.deb"
homepage='https://brave.com/'
pkgdesc="The Brave browser is a fast, private and secure web browser for PC, Mac and mobile - Nightly channel"
hash="a3c3b57b7abbee41e4705f7116c784dceaabe782888641213e82f1d7201b1fc8"
arch=('amd64')
repology=("project: brave" "visiblename: brave-nightly-bin")
maintainer="Elsie19 <elsie19@pm.me>"

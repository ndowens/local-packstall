name="obs-backgroundremoval-deb"
gives="obs-backgroundremoval"
repology=("project: ${gives}")
breaks=("${gives}" "${gives}-git")
pkgver="1.1.10"
url="https://github.com/royshil/obs-backgroundremoval/releases/download/${pkgver}/obs-backgroundremoval-${pkgver}-x86_64-linux-gnu.deb"
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash="402d2498d4de913642dd62bd22801d1854a3c66bf0ffdc075073ba8d093a1f3f"
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
incompatible=("debian:bullseye")

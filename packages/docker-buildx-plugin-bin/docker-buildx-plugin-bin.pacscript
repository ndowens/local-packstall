name="docker-buildx-plugin-bin"
gives="docker-buildx-plugin"
replace=("${gives}")
pkgver="0.12.1"
pkgdesc="Docker Buildx cli plugin"
homepage='https://github.com/docker/buildx'
url="https://github.com/docker/buildx/releases/download/v${pkgver}/buildx-v${pkgver}.linux-${CARCH}"
arch=('amd64' 'arm64')
repology=("project: docker-buildx")
maintainer="Oren Klopfer <oren@taumoda.com>"
if [[ ${CARCH} == "arm64" ]]; then
  hash="fb72d627f2ee080bba70375c367f4292867821e29ca9a8cf485622f6ede8f436"
else
  hash="716321df8ca9c82ffe96f37e9f4aa1199d4969795836dbd57ef72d12e3ac5085"
fi

package() {
  sudo mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  sudo chmod a+x ./"buildx-v${pkgver}.linux-${CARCH}"
  sudo mv ./"buildx-v${pkgver}.linux-${CARCH}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-buildx"
}

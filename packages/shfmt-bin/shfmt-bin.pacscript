#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="shfmt-bin"
pkgname="shfmt"
pkgver="3.7.0"
url="https://github.com/mvdan/sh/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_amd64"
pkgdesc="Format shell programs"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
hash="0264c424278b18e22453fe523ec01a19805ce3b8ebf18eaf3aadc1edc23f42e3"
arch=('amd64')
repology=("project: ${pkgname}")

package() {
  sudo install -Dm755 "shfmt_v${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:

name="keybase-deb"
gives="keybase"
replace=("${gives}")
breaks=("${gives}-git" "${gives}-app" "${gives}")
repology=("project: ${gives}")
# Version and Hash from https://prerelease.keybase.io/deb/dists/stable/main/binary-amd64/Packages
pkgver="6.0.2-20220610191041.a459abf326"
url="https://prerelease.keybase.io/linux_binaries/deb/${gives}_${pkgver}_amd64.deb"
pkgdesc="The Keybase Go client, filesystem, and GUI"
hash="14c85b312b891eae5de44d1d4d5024d36cbce545e686d299624e2a71b9e14712"
arch=('amd64')
maintainer="Marie Piontek <marie@kaifa.ch>"

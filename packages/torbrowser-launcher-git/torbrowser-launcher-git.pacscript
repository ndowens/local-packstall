name="torbrowser-launcher-git"
gives="torbrowser-launcher"
breaks=("${gives}")
repology=("project: ${gives}")
url="https://github.com/micahflee/torbrowser-launcher.git"
pkgver="0.3.6"
makedepends=("build-essential")
depends=("gettext" "python3-pip" "dh-python" "python3-all" "python3-pyqt5" "python3-gpg" "python3-requests" "python3-socks" "python3-packaging" "gnupg2" "tor")
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser in Linux"
optdepends=("apparmor: support for apparmor profiles")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

prepare() {
  sudo pip3 install distro "${pyhack[@]}"
}

build() {
  python3 setup.py build
}

package() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}

name="wezterm-bin"
pkgname="wezterm"
gives="wezterm"
pkgver="20230712-072601-f4abf8fd"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
url="https://github.com/wez/wezterm/releases/download/${pkgver}/wezterm-${pkgver}.Ubuntu22.04.tar.xz"
hash="3b03b75a26a30f2de28180d66c5556e5878f6f3320d79d12fb78ea486400b6c3"
breaks=("${pkgname}-app")
repology=("project: wezterm")
maintainer="smokeythemonkey <smokeythemonkey@posteo.net>"

package() {
  # Install Binaries
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/wezterm" -t "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/open-wezterm-here" "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/strip-ansi-escapes" "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/wezterm-gui" "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/wezterm-mux-server" "${pkgdir}/usr/bin/"

  # Copy Icons and plugins
  sudo cp -r "${SRCDIR}/wezterm/usr/share/"* "/usr/share/"

  # Install .desktop file
  sudo install -Dm644 "${SRCDIR}/wezterm/usr/share/applications/org.wezfurlong.wezterm.desktop" "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"

  # Install wezterm.sh script
  sudo install -Dm755 "${SRCDIR}/wezterm/etc/profile.d/wezterm.sh" "${pkgdir}/etc/profile.d/wezterm.sh"
}

post_install() {
  # Run wezterm.sh script to hook up shell integration
  sudo "/etc/profile.d/wezterm.sh"
}

post_remove() {
  # Remove additional files
  sudo rm -f "/usr/share/bash-completions/wezterm"
  sudo rm -f "/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"
  sudo rm -f "/usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml"
  sudo rm -f "/usr/share/nautilus-python/extensions/wezterm-nautilus.py"
  sudo rm -rf "/usr/share/wezterm/"
  sudo rm -f "/usr/share/zsh/functions/Completion/Unix/_wezterm"

  # Delete wezterm config
  if ask "Do you want to delete wezterm config files?" N; then
    rm -rf "${homedir}/.config/.wezterm/"
  fi
}

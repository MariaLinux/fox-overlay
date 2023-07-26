# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit optfeature prefix

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://gitlab.com/xenia-group/neofetch/-/archive/main/neofetch-main.tar.gz"
	KEYWORDS="amd64 arm arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc x86 ~arm64-macos ~x64-macos"
else
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/xenia-group/neofetch.git"
fi

S="${WORKDIR}/${PN}-main"

DESCRIPTION="Simple information system script - Xenia Linux Fork"
HOMEPAGE="https://gitlab.com/xenia-group/neofetch"
LICENSE="MIT-with-advertising"
SLOT="0"

src_prepare() {
	if use prefix; then
		# bug #693526
		hprefixify neofetch
		sed -e "/has emerge/s:\${br_prefix}:${EPREFIX}:" -i neofetch \
			|| die "Failed to adjust for Prefix"
	fi

	default
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}

pkg_postinst() {
	optfeature "displaying images" "media-libs/imlib2 www-client/w3m[imlib]"
	optfeature "gpu detection" sys-apps/pciutils
	optfeature "thumbnail creation" media-gfx/imagemagick
	optfeature "wallpaper" media-gfx/feh x11-misc/nitrogen
	optfeature "window size" x11-misc/xdotool "x11-apps/xwininfo x11-apps/xprop" "x11-apps/xwininfo x11-apps/xdpyinfo"
}

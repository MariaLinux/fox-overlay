EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1
inherit systemd

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
    KEYWORDS="**"
	EGIT_REPO_URI="https://github.com/MariaLinux/declare-flatpak.git"
else
	SRC_URI="https://github.com/MariaLinux/declare-flatpak/archive/refs/tags/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="amd64 arm64"
fi

S="${WORKDIR}/${P}"

DESCRIPTION="foxdeclare module for flatpaks."
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="xenia-tools/foxcommon"
RDEPEND="${DEPEND}"

src_install() {
    keepdir etc/declare
    distutils-r1_src_install
    systemd_dounit declareflatpak.service
    newinitd declareflatpak.initd declareflatpak
}

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/xenia-group/declare-flatpak.git"
else
	SRC_URI="https://gitlab.com/xenia-group/declare-flatpak/-/archive/main/declare-flatpak-main.tar.gz"
	KEYWORDS="~amd64"
fi

S="${WORKDIR}/${P}"

DESCRIPTION="foxdeclare module for flatpaks."
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND="xenia-tools/foxcommon"
RDEPEND="${DEPEND}"

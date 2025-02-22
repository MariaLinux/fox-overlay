EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MariaLinux/foxupdate.git"
else
	SRC_URI="https://github.com/MariaLinux/foxupdate/archive/refs/heads/main.zip -> ${PN}-${PV}.zip"
	KEYWORDS="~amd64"
fi

S="${WORKDIR}/${P}"

DESCRIPTION="updater for Xenia Linux"
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND="xenia-tools/foxcommon dev-python/tomli-w"
RDEPEND="${DEPEND}"

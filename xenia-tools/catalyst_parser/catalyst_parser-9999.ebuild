EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

if [[ ${PV} = 9999 ]]; then
	inherit git-r3
    KEYWORDS="**"
	EGIT_REPO_URI="https://gitlab.com/xenia-group/catalyst_parser.git"
else
	SRC_URI="https://gitlab.com/xenia-group/catalyst_parser/-/archive/${PV}/catalyst_parser-${PV}.tar.gz"
	KEYWORDS="amd64 arm64"
fi

S="${WORKDIR}/${P}"

DESCRIPTION="Catalyst spec file parser and linting."
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="xenia-tools/foxcommon"

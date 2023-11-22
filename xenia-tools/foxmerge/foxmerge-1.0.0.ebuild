EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
    KEYWORDS="**"
	EGIT_REPO_URI="https://gitlab.com/xenia-group/foxmerge.git"
else
	SRC_URI="https://gitlab.com/xenia-group/foxmerge/-/archive/${PV}/foxmerge-${PV}.tar.gz"
	KEYWORDS="amd64 arm64"
fi

S="${WORKDIR}/${P}"

DESCRIPTION="Portage Wrapper for Xenia Linux"
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-python/fuzzywuzzy
	xenia-tools/foxcommon
	xenia-tools/foxsnapshot
"
RDEPEND="${DEPEND}"

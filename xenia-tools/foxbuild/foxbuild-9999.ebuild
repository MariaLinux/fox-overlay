EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/xenia-group/foxbuild.git"
else
	SRC_URI="https://gitlab.com/xenia-group/foxsbuild/-/archive/main/foxbuild-main.tar.gz"
	KEYWORDS="~amd64"
fi

S="${WORKDIR}/${P}"

DESCRIPTION="Build tool for Xenia Linux custom RootFS"
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

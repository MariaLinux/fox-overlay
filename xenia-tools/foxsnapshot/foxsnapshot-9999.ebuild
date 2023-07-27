EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_UI="https://gitlab.com/xenia-group/foxsnapshot.git"
else
	SRC_URI="https://gitlab.com/xenia-group/foxsnapshot/-/archive/main/foxsnapshot-main.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="btrfs snapshot manager for Xenia Linux"
HOMEPAGE="https://xenialinux.com"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND=""
RDEPEND=""

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils git

DESCRIPTION="A command-line interface to the GitHub Issues API v2"
HOMEPAGE="http://github.com/jsmits/github-cli"
EGIT_REPO_URI="git://github.com/jsmits/github-cli.git"
EGIT_COMMIT="${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/python"
RDEPEND="virtual/python
	dev-vcs/git
	dev-python/simplejson"

DOCS="AUTHORS.txt README.rst"

src_install() {
	distutils_src_install
	doman docs/ghi.1 || die
}

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

MY_REVISION="62e5790"
DESCRIPTION="A command-line interface to the GitHub Issues API v2"
HOMEPAGE="http://github.com/jsmits/github-cli"
SRC_URI="http://download.github.com/jsmits-${P}-0-g${MY_REVISION}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/python"
RDEPEND="virtual/python
	dev-vcs/git
	dev-python/simplejson"

S=${WORKDIR}/jsmits-github-cli-${MY_REVISION}

DOCS="AUTHORS.txt README.rst"

src_install() {
	distutils_src_install
	doman docs/ghi.1 || die
}

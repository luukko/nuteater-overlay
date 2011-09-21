# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

EGIT_REPO_URI="git://git-annex.branchable.com/
	git://git.kitenet.net/git-annex
	git://github.com/joeyh/git-annex.git"
EGIT_COMMIT="${PV}"

inherit eutils git-2

DESCRIPTION="Manage files with git, without checking their contents into git"
HOMEPAGE="http://git-annex.branchable.com"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="crypt s3 test doc"

DEPEND=">=dev-haskell/haskell-platform-2010
	dev-haskell/missingh
	dev-haskell/pcre-light
	dev-haskell/sha
	dev-haskell/utf8-string
	dev-haskell/dataenc
	dev-haskell/monad-control
	dev-haskell/testpack
	s3? ( dev-haskell/hs3 )
	dev-haskell/json
	doc? ( www-apps/ikiwiki )
	dev-vcs/git
	|| ( sys-apps/util-linux dev-libs/ossp-uuid )
	|| ( net-misc/curl net-misc/wget )
	net-misc/rsync
	crypt? ( app-crypt/gnupg )"

RDEPEND="${DEPEND}"

src_prepare() {
	use doc || epatch "${FILESDIR}/${PN}-no-docs.patch"
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc CHANGELOG
}

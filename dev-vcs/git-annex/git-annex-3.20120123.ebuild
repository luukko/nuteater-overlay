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
IUSE="crypt test doc"

DEPEND=">=dev-lang/ghc-6.10.1
	dev-haskell/dataenc
	dev-haskell/hslogger
	dev-haskell/http
	dev-haskell/json
	dev-haskell/lifted-base
	dev-haskell/missingh
	dev-haskell/monad-control
	dev-haskell/mtl
	dev-haskell/network
	dev-haskell/pcre-light
	dev-haskell/sha
	dev-haskell/transformers-base
	dev-haskell/utf8-string
	dev-haskell/hs3
	doc? ( www-apps/ikiwiki )
	test? ( dev-haskell/testpack )
	>=dev-vcs/git-1.7.7
	|| ( sys-apps/util-linux dev-libs/ossp-uuid )
	|| ( net-misc/curl net-misc/wget )
	net-misc/rsync
	crypt? ( app-crypt/gnupg )"

RDEPEND="${DEPEND}"

src_prepare() {
	use doc || epatch "${FILESDIR}/${PN}-no-docs-2.patch"
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc CHANGELOG
}

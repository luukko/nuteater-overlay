# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="SIMD-oriented Fast Mersenne Twister"
HOMEPAGE="http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/index.html"
SRC_URI="http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/VERSIONS/ARCHIVES/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="sse2"

src_compile() {
	econf $(use_enable sse2) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc ChangeLog NEWS README
}

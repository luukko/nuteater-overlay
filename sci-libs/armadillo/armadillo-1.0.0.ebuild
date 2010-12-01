# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"
inherit eutils

DESCRIPTION="C++ linear algebra library"
HOMEPAGE="http://arma.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/arma/${PF}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lapack blas boost"

DEPEND="dev-util/cmake
	>=sys-devel/gcc-4.0.0
	lapack? ( virtual/lapack )
	blas? ( virtual/blas )
	boost? ( >=dev-libs/boost-1.34 )"

S=${WORKDIR}/${PF}

src_compile() {
	cd ${S}
	cmake .
	emake || die "emake failed"
}

src_install(){
	make DESTDIR="${D}" install || die "Error: Install failed"
}

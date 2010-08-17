# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="linux-firmware-${PV}"
DESCRIPTION="rt2860 firmware files"
HOMEPAGE="http://www.kernel.org/pub/linux/kernel/people/dwmw2/firmware"
SRC_URI="mirror://kernel/linux/kernel/people/dwmw2/firmware/${MY_P}.tar.bz2"

LICENSE="freedist"
KEYWORDS="~x86"
SLOT="0"
RDEPEND="!sys-kernel/linux-firmware"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
}

src_install() {
	dodir /lib/firmware
	cp "${S}/rt2860.bin" "${D}lib/firmware/" || die "Install failed!"
}

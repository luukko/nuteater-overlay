# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
inherit eutils distutils

DESCRIPTION="Tools to manage Hotkeys, WLAN, Bluetooth and other features of an Asus EeePC."
HOMEPAGE="https://launchpad.net/eee-control/"
SRC_URI="https://launchpad.net/~eee-control/+archive/eee-control/+files/eee-control_0.9.6.5.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"

IUSE="gnome gtk +xosd"

RDEPEND="gtk? ( dev-python/pygtk dev-python/gconf-python )
	gnome? ( gnome-extra/gnome-power-manager )
	xosd? ( x11-libs/xosd )
	dev-python/notify-python
	dev-python/dbus-python
	>=sys-apps/i2c-tools-3.0.2[python]
	sys-power/acpid"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}/${P}-tray.py.patch"
}

src_compile() {
	cd "${S}"
	(python setup.py build && sh locale/update.sh) || die "Building the package failed!"
}

src_install() {
	cd "${S}"
	python setup.py install --root ${D}  || die "The base installation routine failed!"
	newinitd  ${FILESDIR}/eee-control-gentooinit eee-control || die "Inserting init script failed."
	newconfd ${FILESDIR}/eee-control-gentooconf eee-control || die "Inserting conf.d script failed."
	dodoc doc/README || die "Installing documentation failed."
	insinto /etc
	doins data/eee-control.conf
}

pkg_setup() {
	enewgroup powerdev
}

pkg_postinst() {
	elog "To use the eee-control-tray in your desktop environment as regular user, add"
	elog "yourself to the powerdev group."
	echo
	elog "Please visit http://forums.gentoo.org/viewtopic-p-5280572.html to share your"
	elog "experience with this ebuild."
	echo
	ewarn "Audio hotkeys are no longer handled by eee-control. Make sure your"
	ewarn "window manager or some other application maps them to relevant"
	ewarn "functions."
}

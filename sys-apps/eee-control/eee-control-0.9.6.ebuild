# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils distutils git

DESCRIPTION="Tools to manage Hotkeys, WLAN, Bluetooth and other features of an Asus EeePC."
HOMEPAGE="http://greg.geekmind.org/eee-control/"
EGIT_REPO_URI="git://greg.geekmind.org/eee-control.git"
EGIT_COMMIT="${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"

IUSE="gnome gtk kde alsa +xosd"

RDEPEND="gtk? ( dev-python/pygtk dev-python/gconf-python )
	gnome? ( gnome-extra/gnome-power-manager )
	xosd? ( x11-libs/xosd )
	alsa? ( dev-python/pyalsaaudio )
	dev-python/notify-python
	dev-python/dbus-python
	>=sys-apps/i2c-tools-3.0.2[python]
	kde? ( x11-themes/gtk-engines-qt )"

src_compile() {
	cd "${S}"
	(python setup.py build && sh locale/update.sh) || die "Building the package failed!"
}

src_install() {
	cd "${S}"
	if use alsa; then
		epatch ${FILESDIR}/${P}-actions.py.patch || die "Patching actions.py failed."
	fi
	python setup.py install --root ${D}  || die "The base installation routine failed!"
	newinitd  ${FILESDIR}/eee-control-gentooinit eee-control || die "Inserting init script failed."
	dodoc doc/README || die "Installing documentation failed."
	insinto /etc
	doins data/eee-control.conf
}

pkg_setup() {
	enewgroup powerdev
}

pkg_postinst() {
	ewarn "Before you start eee-control daemon, it is vitally important to remove/disable"
	ewarn "all EeePC related stuff from /etc/acpi and restart acpid."
	echo
	elog "A 2.6.27 kernel or higher is required, with full support for the EeePC hardware."
	elog "Go to http://www.zirona.com/misc/code/eee-control/eeepc-kernelconfig for a"
	elog 'sample .config (use with `make oldconfig`).'
	echo
	ewarn "To use the eee-control-tray in your desktop environment as regular user, add"
	ewarn "yourself to the powerdev group."
	echo
	elog "Please note that eee-control now has a configuration file which is"
	elog "installed at /etc/eee-control.conf "
	echo
	elog "Please visit http://forums.gentoo.org/viewtopic-p-5280572.html to share your"
	elog "experience with this ebuild."
	echo

	if ! use gnome; then
		elog "If you want eee-control to use features of the gnome-power-manager, please"
		elog "emerge gnome-extra/gnome-power-manager (if you haven't already), or re-emerge"
		elog "this package with the gnome USE flag enabled."
	fi
}

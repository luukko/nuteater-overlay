# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Python package for interpreting METAR and SPECI weather reports"
HOMEPAGE="http://pypi.python.org/pypi/metar/"
SRC_URI="mirror://sourceforge/python-metar/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DOCS="CHANGES README get_report.py parse_metar.py sample.py"

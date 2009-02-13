# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion
DESCRIPTION="Web Application Attack and Audit Framework"
HOMEPAGE="http://w3af.sourceforge.net/"
ESVN_REPO_URI="https://w3af.svn.sourceforge.net/svnroot/w3af/trunk"

LICENSE="GPL-2"
KEYWORDS="-* ~x86"
IUSE=""
SLOT="0"
RDEPEND="dev-python/utidylib
	 dev-python/soappy
	 dev-python/pyopenssl"
#pyopenssl should be pulled in by twisted but if the user doesn't have 
#the crypt useflag we need to install directly this should essentially affect no one

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
        dodir /usr/lib/
        # should be as simple as copying everything into the target...
        cp -pPR ${S} ${D}usr/lib/w3af || die
	dobin "${FILESDIR}"/w3af_gui
	dobin "${FILESDIR}"/w3af_console
        chown -R root:0 ${D}
}

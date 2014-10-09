# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/metasploit_data_models/metasploit_data_models-0.17.0.ebuild,v 1.3 2014/07/09 21:13:54 zerochaos Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

inherit ruby-fakegem versionator

DESCRIPTION="The database layer for Metasploit"
HOMEPAGE="https://github.com/rapid7/metasploit_data_models"
SRC_URI="mirror://rubygems/${P}.gem"

LICENSE="BSD"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
		>=dev-ruby/activerecord-3.2.13[postgres]
		dev-ruby/activesupport
		dev-ruby/pg
		<dev-ruby/railties-4.0.0
		dev-ruby/arel-helpers
		=dev-ruby/metasploit-concern-0.3*
		=dev-ruby/metasploit-model-0.28*"

each_ruby_prepare() {
	if [ -f Gemfile ] 
	then
		BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle install --local || die
		BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle check || die
	fi
}

all_ruby_install() {
	ruby_fakegem_binwrapper mdm_console mdm_console-${SLOT}
}
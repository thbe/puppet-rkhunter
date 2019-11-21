# Class: rkhunter::package
#
# This module contain the package configuration for rkhunter
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class rkhunter::package {
  package { $rkhunter::params::package_common: ensure => installed; }
  case $::osfamily {
    'Debian', 'Gentoo', 'Archlinux': {
      package { $rkhunter::params::package_unhide: ensure => installed; }
    }
    default: {}
  }
}

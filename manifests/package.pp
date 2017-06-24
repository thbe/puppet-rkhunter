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
  if $::osfamily == 'Debian' {
    package { $rkhunter::params::package_unhide: ensure => installed; }
  }
  if $::osfamily == 'Gentoo' {
    package { $rkhunter::params::package_unhide: ensure => installed; }
  }
}

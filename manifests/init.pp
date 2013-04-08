# Class: rkhunter
#
# This module manages rkhunter
#
# Parameters:
#  packageCore = name of the core package
#  tftp = boolean, should tftp check be enable or disabled
#  check_mk = boolean, should check_mk check be enable or disabled
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#  include rkhunter{ tftp=true }
#
class rkhunter (
  $packageCore = $rkhunter::params::packageCore,
  $tftp        = $rkhunter::params::tftp,
  $check_mk    = $rkhunter::params::check_mk,
  $icman       = $rkhunter::params::icman) inherits rkhunter::params {
  # Include Puppetlabs standard library
  include stdlib

  # Start workflow
  anchor { 'rkhunter::clientStart': } -> class { 'rkhunter::package': } ~> class 
  { 'rkhunter::config': } ~> class { 'rkhunter::service': } ~> anchor { 'rkhunter::clientEnd'
  : }
}
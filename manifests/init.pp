# == Class: rkhunter
#
# This module manages rkhunter
#
# === Parameters
#
# Document parameters here.
#  tftp = boolean, should tftp check be enabled or disabled
#  check_mk = boolean, should check_mk check be enabled or disabled
#  icman = boolean, should icman network check be enabled or disabled
#
# [*rootEmail*]
#   Set the root email adress that get notifications if events occur
#
# [*tftp*]
#   Ignore check errors forced by tftp
#
# [*check_mk*]
#   Ignore check errors forced by check_mk
#
# [*oracleXE*]
#   Ignore check errors forced by Oracle XE
#
# [*sapDAA*]
#   Ignore check errors forced by SAP DAA
#
# [*sapICM*]
#   Ignore check errors forced by SAP ICM
#
# === Variables
#
# === Examples
#
#  class { '::rkhunter':
#    tftp => true
#  }
#
# === Authors
#
# Author Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2013 Thomas Bendler
#
class rkhunter (
  $rootEmail = $rkhunter::params::rootEmail,
  $tftp      = $rkhunter::params::tftp,
  $check_mk  = $rkhunter::params::check_mk,
  $oracleXE  = $rkhunter::params::oracleXE,
  $sapDAA    = $rkhunter::params::sapDAA,
  $sapICM    = $rkhunter::params::sapICM
) inherits rkhunter::params {
  # Include Puppetlabs standard library
  include stdlib

  # Start workflow
  if $rkhunter::params::linux {
    anchor { 'rkhunter::start': }
    -> class { 'rkhunter::package': }
    ~> class { 'rkhunter::config': }
    ~> class { 'rkhunter::service': }
    ~> anchor { 'rkhunter::end': }
  }
}

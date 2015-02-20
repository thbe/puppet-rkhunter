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
# [*remoteSyslog*]
#   Set to true when remote syslog is enabled
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
# [*sapDB*]
#   Ignore check errors forced by SAPDB/MaxDB
#
# [*sshd_root*]
#   Surpress warning if root login is permit.
#   Should be the same as PermitRootLogin in sshd_config
#
# === Variables
#
# === Examples
#
#  class { '::rkhunter':
#    tftp => true,
#    sshd_root => 'without-password'
#  }
#
# === Authors
#
# Author Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2015 Thomas Bendler
#
class rkhunter (
  $rootEmail     = $rkhunter::params::rootEmail,
  $remoteSyslog  = $rkhunter::params::remoteSyslog,
  $tftp          = $rkhunter::params::tftp,
  $check_mk      = $rkhunter::params::check_mk,
  $oracleXE      = $rkhunter::params::oracleXE,
  $sapDAA        = $rkhunter::params::sapDAA,
  $sapICM        = $rkhunter::params::sapICM,
  $sapDB        = $rkhunter::params::sapDB,
  $disable_tests = $rkhunter::params::disable_tests,
  $sshd_root     = $rkhunter::params::sshd_root,
) inherits rkhunter::params {
  # Require class yum to have the relevant repositories in place
  require yum

  # Start workflow
  if $rkhunter::params::linux {
    # Containment
    contain rkhunter::package
    contain rkhunter::config
    contain rkhunter::service

    Class['rkhunter::package'] ->
    Class['rkhunter::config']  ->
    Class['rkhunter::service']
  }
}

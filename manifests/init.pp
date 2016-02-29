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
# [*root_email*]
#   Set the root email adress that get notifications if events occur
#
# [*remote_syslog*]
#   Set to true when remote syslog is enabled
#
# [*tftp*]
#   Ignore check errors forced by tftp
#
# [*check_mk*]
#   Ignore check errors forced by check_mk
#
# [*oracle_xe*]
#   Ignore check errors forced by Oracle XE
#
# [*sap_daa*]
#   Ignore check errors forced by SAP DAA
#
# [*sap_icm*]
#   Ignore check errors forced by SAP ICM
#
# [*sap_db*]
#   Ignore check errors forced by SAPDB/MaxDB
#
# [*sshd_root*]
#   Surpress warning if root login is permit.
#   Should be the same as PermitRootLogin in sshd_config
#
# [*web_cmd*]
#   Command used to retrieve files from the internet (ie: while
#   running with --update)
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
# Copyright 2016 Thomas Bendler
#
class rkhunter (
  $root_email           = $rkhunter::params::root_email,
  $warning_email        = $rkhunter::params::warning_email,
  $enable_warning_email = $rkhunter::params::enable_warning_email,
  $remote_syslog        = $rkhunter::params::remote_syslog,
  $tftp                 = $rkhunter::params::tftp,
  $check_mk             = $rkhunter::params::check_mk,
  $oracle_xe            = $rkhunter::params::oracle_xe,
  $sap_daa              = $rkhunter::params::sap_daa,
  $sap_icm              = $rkhunter::params::sap_icm,
  $sap_db               = $rkhunter::params::sap_db,
  $sshd_root            = $rkhunter::params::sshd_root,
  $web_cmd              = $rkhunter::params::web_cmd,
  $disable_tests        = $rkhunter::params::disable_tests
) inherits rkhunter::params {

  # Start workflow
  if $rkhunter::params::linux {
    # Containment
    contain rkhunter::package
    contain rkhunter::config
    contain rkhunter::service

    Class['rkhunter::package'] ->
    Class['rkhunter::config']  ->
    Class['rkhunter::service']
  } else {
    warning('The current operating system is not supported!')
  }
}

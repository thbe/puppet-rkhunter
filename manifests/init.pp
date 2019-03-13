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
#   Set the root email address that get notifications if events occur
#
# [*warning_email*]
#   Set the email address that gets notifications if warnings occur
#
# [*enable_warning_email*]
#   Set to true to send emails on warnings (default: false)
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
# [*sap_igs*]
#   Ignore check errors forced by SAP IGS
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
# [*cron_daily_run*]
#   Enable/Disable Cron daily runs
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
# Copyright 2017 Thomas Bendler
#
class rkhunter (
  $root_email           = $rkhunter::params::root_email,
  $warning_email        = $rkhunter::params::warning_email,
  $enable_warning_email = $rkhunter::params::enable_warning_email,
  $remote_syslog        = $rkhunter::params::remote_syslog,
  $tftp                 = $rkhunter::params::tftp,
  $check_mk             = $rkhunter::params::check_mk,
  $oracle_xe            = $rkhunter::params::oracle_xe,
  $sap_igs              = $rkhunter::params::sap_igs,
  $sap_icm              = $rkhunter::params::sap_icm,
  $sap_db               = $rkhunter::params::sap_db,
  $sshd_root            = $rkhunter::params::sshd_root,
  $ssh_prot_v1          = $rkhunter::params::ssh_prot_v1,
  $web_cmd              = $rkhunter::params::web_cmd,
  $disable_tests        = $rkhunter::params::disable_tests,
  $cron_daily_run       = $rkhunter::params::cron_daily_run
) inherits rkhunter::params {

  # Start workflow
  if $rkhunter::params::linux {
    class{ '::rkhunter::package': }
    -> class{ '::rkhunter::config': }
    -> class{ '::rkhunter::service': }
    -> Class['rkhunter']
  } else {
    warning('The current operating system is not supported!')
  }
}

# == Class: rkhunter
#
# This module manages rkhunter
#
# === Parameters
#
# @param tftp boolean, should tftp check be enabled or disabled
# @param check_mk boolean, should check_mk check be enabled or disabled
# @param root_email Set the root email address that get notifications if events occur
# @param warning_email Set the email address that gets notifications if warnings occur
# @param enable_warning_email Set to true to send emails on warnings (default: false)
# @param remote_syslog Set to true when remote syslog is enabled
# @param tftp Ignore check errors forced by tftp
# @param check_mk Ignore check errors forced by check_mk
# @param check_mk_script Define the location of the check_mk script
# @param oracle_xe Ignore check errors forced by Oracle XE
# @param sap_igs Ignore check errors forced by SAP IGS
# @param sap_icm Ignore check errors forced by SAP ICM
# @param sap_db Ignore check errors forced by SAPDB/MaxDB
# @param sshd_root Surpress warning if root login is permit. Should be the same as PermitRootLogin in sshd_config
# @param ssh_prot_v1 Define the minimum ssh protocol version, should be 2
# @param web_cmd Command used to retrieve files from the internet (ie: while running with --update)
# @param disable_tests List of test that should not be performed
# @param cron_daily_run Enable/Disable Cron daily runs
# @param cron_db_update Enable/Disable Cron database update runs
#
# === Variables
#
# === Examples
#
# @example Declaring the class
#   class { '::rkhunter':
#     tftp => true,
#     sshd_root => 'without-password'
#   }
#
# === Authors
#
# Author Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2019 Thomas Bendler
#
class rkhunter (
  $root_email           = $rkhunter::params::root_email,
  $warning_email        = $rkhunter::params::warning_email,
  $enable_warning_email = $rkhunter::params::enable_warning_email,
  $remote_syslog        = $rkhunter::params::remote_syslog,
  $tftp                 = $rkhunter::params::tftp,
  $check_mk             = $rkhunter::params::check_mk,
  $check_mk_script      = $rkhunter::params::check_mk_script,
  $oracle_xe            = $rkhunter::params::oracle_xe,
  $sap_igs              = $rkhunter::params::sap_igs,
  $sap_icm              = $rkhunter::params::sap_icm,
  $sap_db               = $rkhunter::params::sap_db,
  $sshd_root            = $rkhunter::params::sshd_root,
  $ssh_prot_v1          = $rkhunter::params::ssh_prot_v1,
  $web_cmd              = $rkhunter::params::web_cmd,
  $disable_tests        = $rkhunter::params::disable_tests,
  $cron_daily_run       = $rkhunter::params::cron_daily_run,
  $cron_db_update       = $rkhunter::params::cron_db_update
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

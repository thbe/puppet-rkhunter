# Class: rkhunter::config
#
# This module contain the configuration for rkhunter
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include rkhunter::config
#
class rkhunter::config {

  # pull exlicitly into scope
  $disable_tests = $rkhunter::disable_tests

  file {
    $rkhunter::params::configRkhunterConf:
      ensure  => present,
      mode    => '0640',
      owner   => root,
      group   => root,
      path    => $rkhunter::params::configRkhunterConf,
      content => template($rkhunter::params::configRkhunterConfTemplate);

      $rkhunter::params::configRkhunterSysConf:
      ensure  => present,
      mode    => '0640',
      owner   => root,
      group   => root,
      path    => $rkhunter::params::configRkhunterSysConf,
      content => template($rkhunter::params::configRkhunterSysConfTemplate);
  }

  file {
    $rkhunter::params::configRkhunterScriptDirectory:
      ensure  => directory,
      mode    => '0755',
      owner   => root,
      group   => root;

    $rkhunter::params::configRkhunterScript:
      ensure  => present,
      mode    => '0755',
      owner   => root,
      group   => root,
      path    => $rkhunter::params::configRkhunterScript,
      content => template($rkhunter::params::configRkhunterScriptTemplate);
  }
}

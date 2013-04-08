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
  # rkhunter configuration
  # file {
  #  "/etc/rkhunter/conf.d":
  #  mode => 750, owner => root, group => root,
  #  ensure => directory;
  #}
  file {
    '/etc/sysconfig/rkhunter':
      ensure  => present,
      mode    => 640,
      owner   => root,
      group   => root,
      path    => $::operatingsystem ? {
        default => '/etc/sysconfig/rkhunter'
      },
      content => template('rkhunter/sysconfig/rkhunter.erb');

    '/etc/rkhunter.conf':
      ensure  => present,
      mode    => 640,
      owner   => root,
      group   => root,
      path    => $::operatingsystem ? {
        default => '/etc/rkhunter.conf'
      },
      content => template('rkhunter/etc/rkhunter.conf.erb');
  }
}
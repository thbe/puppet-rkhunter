# Class: rkhunter::service
#
# This module contain the service configuration for rkhunter
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include rkhunter::service
#
class rkhunter::service {
  # rkhunter service configuration
  exec { 'Update rkhunter database':
    command => "${rkhunter::params::rkhunter_bin} --propupdate && /bin/touch ${::rkhunter::params::config_rkhunter_sys_conf_upd}",
    onlyif  => "/usr/bin/test ! -e ${::rkhunter::params::config_rkhunter_sys_conf_upd}",
  }
}


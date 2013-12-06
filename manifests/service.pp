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
  exec { "Update rkhunter database":
    command => "/usr/bin/rkhunter --propupdate && /bin/touch ${::rkhunter::params::configRkhunterSysConfUpd}",
    onlyif  => "/usr/bin/test ! -e ${::rkhunter::params::configRkhunterSysConfUpd}",
  }
}

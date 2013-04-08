# Class: rkhunter::params
#
# This module contain the parameters for rkhunter
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include rkhunter::params
#
class rkhunter::params {
  # rkhunter definitions
  $packageCore = 'rkhunter'
  $tftp = false
  $check_mk = false
  $icman = false
}
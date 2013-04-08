# Class: rkhunter::package
#
# This module contain the package configuration for rkhunter
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class rkhunter::package {
  package { '$rkhunter::packageCore': ensure => installed; }
}
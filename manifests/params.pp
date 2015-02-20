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
  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux = true

      # Package definition
      $packageCommon = 'rkhunter'

      # Config definition
      $configRkhunterConf = '/etc/rkhunter.conf'
      $configRkhunterConfTemplate = 'rkhunter/etc/rkhunter.conf.erb'
      $configRkhunterSysConf = '/etc/sysconfig/rkhunter'
      $configRkhunterSysConfTemplate = 'rkhunter/sysconfig/rkhunter.erb'
      $configRkhunterSysConfUpd = '/etc/sysconfig/rkhunter-propupdate'
      $configRkhunterScriptDirectory = '/etc/rkhunter.d'
      $configRkhunterScript = '/etc/rkhunter.d/checkWhiteList.sh'
      $configRkhunterScriptTemplate = 'rkhunter/scripts/checkWhiteList.sh.erb'
    }
    default  : {
      $linux = false
    }
  }

  # rkhunter definitions
  $rootEmail = 'john.doe@example.com'
  $logFile = '/var/log/rkhunter/rkhunter.log'
  $remoteSyslog = false
  $tftp = false
  $check_mk = false
  $oracleXE = false
  $sapDAA = false
  $sapICM = false
  $sapDB = false
  $sshd_root = 'unset'
  $disable_tests = ['suspscan', 'hidden_procs', 'deleted_files', 'packet_cap_apps', 'apps']
}

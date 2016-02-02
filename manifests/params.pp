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
      $linux                             = true

      # Package definition
      $package_common                    = 'rkhunter'

      # Config definition
      $config_rkhunter_conf              = '/etc/rkhunter.conf'
      $config_rkhunter_conf_template     = 'rkhunter/etc/rkhunter.conf.erb'
      $config_rkhunter_sys_conf          = '/etc/sysconfig/rkhunter'
      $config_rkhunter_sys_conf_template = 'rkhunter/sysconfig/rkhunter.erb'
      $config_rkhunter_sys_conf_upd      = '/etc/sysconfig/rkhunter-propupdate'
      $config_rkhunter_script_directory  = '/etc/rkhunter.d'
      $config_rkhunter_script            = '/etc/rkhunter.d/checkWhiteList.sh'
      $config_rkhunter_script_template   = 'rkhunter/scripts/checkWhiteList.sh.erb'
    }
    default  : {
      $linux                             = false
    }
  }

  # rkhunter definitions
  $root_email                            = 'john.doe@example.com'
  $log_file                              = '/var/log/rkhunter/rkhunter.log'
  $remote_syslog                         = false
  $tftp                                  = false
  $check_mk                              = false
  $oracle_xe                             = false
  $sap_daa                               = false
  $sap_icm                               = false
  $sap_db                                = false
  $sshd_root                             = 'unset'
  $web_cmd                               = 'unset'
  $disable_tests                         = ['suspscan', 'hidden_procs', 'deleted_files', 'packet_cap_apps', 'apps']
}

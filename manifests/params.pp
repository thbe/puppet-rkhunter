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

      # Misc
      $rkhunter_bin                      = '/usr/bin/rkhunter'
      $log_file                          = '/var/log/rkhunter/rkhunter.log'
      $package_manager                   = 'RPM'
    }
    'Debian' : {
      $linux                             = true

      # Package definition
      $package_common                    = 'rkhunter'
      $package_unhide                    = 'unhide'

      # Config definition
      $config_rkhunter_conf              = '/etc/rkhunter.conf'
      $config_rkhunter_conf_template     = 'rkhunter/etc/rkhunter.conf.erb'
      $config_rkhunter_sys_conf          = '/etc/default/rkhunter'
      $config_rkhunter_sys_conf_template = 'rkhunter/sysconfig/rkhunter.erb'
      $config_rkhunter_sys_conf_upd      = '/etc/default/rkhunter-propupdate'
      $config_rkhunter_script_directory  = '/usr/share/rkhunter/scripts'
      $config_rkhunter_script            = '/usr/share/rkhunter/scripts/checkWhiteList.sh'
      $config_rkhunter_script_template   = 'rkhunter/scripts/checkWhiteList.sh.erb'

      # Misc
      $rkhunter_bin                      = '/usr/bin/rkhunter'
      $log_file                          = '/var/log/rkhunter.log'
      $package_manager                   = 'DPKG'
    }
    'Gentoo' : {
      $linux                             = true

      # Package definition
      $package_common                    = 'app-forensics/rkhunter'
      $package_unhide                    = 'app-forensics/unhide'

      # Config definition
      $config_rkhunter_conf              = '/etc/rkhunter.conf'
      $config_rkhunter_conf_template     = 'rkhunter/etc/rkhunter.conf.erb'
      $config_rkhunter_sys_conf          = '/etc/conf.d/rkhunter'
      $config_rkhunter_sys_conf_template = 'rkhunter/sysconfig/rkhunter.erb'
      $config_rkhunter_sys_conf_upd      = '/etc/conf.d/rkhunter-propupdate'
      $config_rkhunter_script_directory  = '/usr/lib/rkhunter/scripts'
      $config_rkhunter_script            = '/usr/lib/rkhunter/scripts/checkWhiteList.sh'
      $config_rkhunter_script_template   = 'rkhunter/scripts/checkWhiteList.sh.erb'

      # Misc
      $rkhunter_bin                      = '/usr/sbin/rkhunter'
      $log_file                          = '/var/log/rkhunter.log'
      $package_manager                   = 'NONE'
    }
    default  : {
      $linux                             = false
    }
  }

  # rkhunter definitions
  $root_email                            = 'john.doe@example.com'
  $warning_email                         = 'john.doe@example.com'
  $enable_warning_email                  = false
  $remote_syslog                         = false
  $tftp                                  = false
  $check_mk                              = false
  $check_mk_script                       = '/etc/xinetd.d/check_mk'
  $oracle_xe                             = false
  $sap_igs                               = false
  $sap_icm                               = false
  $sap_db                                = false
  $sshd_root                             = 'unset'
  $ssh_prot_v1                           = 0
  $web_cmd                               = 'unset'
  $disable_tests                         = ['suspscan', 'hidden_procs', 'deleted_files', 'packet_cap_apps', 'apps']
  $cron_daily_run                        = 'y'
  $cron_db_update                        = 'y'
}

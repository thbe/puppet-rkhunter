# This define class can be used to whitelist specific stuff on rkhunter
define rkhunter::whitelist (
  Array $list = [],
  String $filename = "${rkhunter::params::config_rkhunter_script_directory}/whitelist.conf",
) {
  file { $filename:
    ensure  => 'present',
    content => join(concat(['# Managed by Puppet !'], $list), "\n"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}

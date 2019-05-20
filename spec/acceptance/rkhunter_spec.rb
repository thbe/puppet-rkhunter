# NOTE: the require must match the name of the helper file created above.
#   If you changed the name there, you'll have to change it here.
#   You can verify this is correct when you see the log statement from the helper.
require 'spec_helper_acceptance'

describe 'rkhunter' do
  let(:manifest) do
    <<-CLASSPARAMETER
class { 'rkhunter':
  root_email           => 'john.doe@example.com',
  warning_email        => 'john.doe@example.com',
  enable_warning_email => true,
  remote_syslog        => true,
  tftp                 => true,
  check_mk             => true,
  oracle_xe            => true,
  sap_igs              => true,
  sap_icm              => true,
  sap_db               => true,
  sshd_root            => 'without-password',
  web_cmd              => 'curl',
  cron_daily_run       => 'y',
  cron_db_update       => 'y',
  disable_tests        => ['suspscan','hidden_procs','deleted_files','packet_cap_apps','apps'],
}
CLASSPARAMETER
  end

  it 'runs without errors' do
    apply_manifest(manifest, catch_failures: true)
  end

  it 'runs a second time without changes' do
    apply_manifest(manifest, catch_failures: true)
  end

  describe file('/etc/rkhunter.conf') do
    it { is_expected.to be_file }
    it { is_expected.to exist }
  end

  describe package('rkhunter') do
    it { is_expected.to be_installed }
  end
end

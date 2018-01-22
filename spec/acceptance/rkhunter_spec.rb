require 'spec_helper_acceptance'

describe 'rkhunter' do
  let(:manifest) {
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
  disable_tests        => ['suspscan','hidden_procs','deleted_files','packet_cap_apps','apps'],
}
CLASSPARAMETER
  }

  it 'should apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end

  describe file('/etc/rkhunter.conf') do
    it { should be_file }
    it { should exist }
  end

  describe package('rkhunter') do
    it { should be_installed }
  end
end

require 'spec_helper'

describe 'rkhunter', :type => :class do

  context 'with defaults for all parameters' do
    it { should contain_class('rkhunter') }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:params) {
        {
          :root_email => 'john.doe@example.com',
          :warning_email => 'john.doe@example.com',
          :enable_warning_email => true,
          :remote_syslog => true,
          :tftp => true,
          :check_mk => true,
          :oracle_xe => true,
          :sap_daa => true,
          :sap_icm => true,
          :sap_db => true,
          :sshd_root => 'without-password',
          :web_cmd => 'curl',
          :disable_tests => [ 'suspscan', 'hidden_procs', 'deleted_files', 'packet_cap_apps', 'apps' ]
        }
      }

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('rkhunter::package') }
      it { is_expected.to contain_class('rkhunter::config') }
      it { is_expected.to contain_class('rkhunter::service') }

      it { is_expected.to contain_file('/etc/rkhunter.conf').with_ensure('file') }

      it 'should generate valid content for rkhunter.conf - generic part' do
        content = catalogue.resource('file', '/etc/rkhunter.conf').send(:parameters)[:content]
        expect(content).to match('MAIL-ON-WARNING=john.doe@example.com')
        expect(content).to match('ALLOW_SSH_ROOT_USER=without-password')
        expect(content).to match('DISABLE_TESTS=suspscan hidden_procs deleted_files packet_cap_apps apps')
        expect(content).to match('ALLOW_SYSLOG_REMOTE_LOGGING=1')
        expect(content).to match('WEB_CMD=curl')
        expect(content).to match('XINETD_ALLOWED_SVC=/etc/xinetd.d/tftp')
        expect(content).to match('XINETD_ALLOWED_SVC=/etc/xinetd.d/check_mk')
        expect(content).to match('ALLOWDEVFILE=/dev/shm/ora_XE_*')
        expect(content).to match('PORT_PATH_WHITELIST=/usr/sap/DAA/SMDA97/exe/jstart:TCP:47107')
        expect(content).to match('PORT_WHITELIST=TCP:25000')
        expect(content).to match('ALLOWDEVFILE=/dev/shm/SDBTech-KSS-SHM-*')
      end

      case facts[:osfamily]
      when 'RedHat'
        it { is_expected.to contain_package('rkhunter').with_ensure('installed') }

        it { is_expected.to contain_file('/etc/rkhunter.d').with_ensure('directory') }
        it { is_expected.to contain_file('/etc/sysconfig/rkhunter').with_ensure('file') }
        it { is_expected.to contain_file('/etc/rkhunter.d/checkWhiteList.sh').with_ensure('file') }

        it 'should generate valid content for rkhunter.conf - RedHat part' do
          content = catalogue.resource('file', '/etc/rkhunter.conf').send(:parameters)[:content]
          expect(content).to match('SCRIPTDIR=/etc/rkhunter.d')
          expect(content).to match('LOGFILE=/var/log/rkhunter/rkhunter.log')
          expect(content).to match('PKGMGR=RPM')
          expect(content).to match('EXISTWHITELIST=/var/log/pki-ca/system')
          expect(content).to match('# FreeIPA Certificate Authority')
        end

        it 'should generate valid content for sysconfig rkhunter - RedHat part' do
          content = catalogue.resource('file', '/etc/sysconfig/rkhunter').send(:parameters)[:content]
          expect(content).to match('MAILTO=john.doe@example.com')
        end
      when 'Debian'
        it 'should generate valid content for rkhunter.conf - Debian part' do
          content = catalogue.resource('file', '/etc/rkhunter.conf').send(:parameters)[:content]
          expect(content).to match('PKGMGR=DPKG')
        end
      when 'Gentoo'
        it 'should generate valid content for rkhunter.conf - Gentoo part' do
          content = catalogue.resource('file', '/etc/rkhunter.conf').send(:parameters)[:content]
          expect(content).to match('PKGMGR=NONE')
        end
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end

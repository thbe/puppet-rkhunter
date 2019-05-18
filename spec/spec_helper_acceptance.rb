require 'beaker-puppet'
require 'beaker-rspec'
require 'beaker/module_install_helper'
require 'beaker/testmode_switcher'
require 'beaker/testmode_switcher/dsl'

# Install Puppet on all hosts
install_puppet_agent_on(hosts, :puppet_collection => 'puppet')
configure_type_defaults_on(hosts)

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Loop through hosts
    hosts.each do |host|
      # Install the Puppet module that should be tested
      install_dev_puppet_module_on(host, :source => module_root, :module_name => 'rkhunter')
      # Install Puppet module dependencies
      install_module_dependencies_on(hosts)
    end
  end
end

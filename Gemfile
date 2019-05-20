source ENV['GEM_SOURCE'] || "https://rubygems.org"

# calculate the correct package names from the current ruby version
ruby_version_segments = Gem::Version.new(RUBY_VERSION.dup).segments
minor_version = "#{ruby_version_segments[0]}.#{ruby_version_segments[1]}"

gem 'coveralls'
# gem 'facter'
# gem 'fast_gettext'
gem 'github_changelog_generator'
# gem 'hiera'
# gem 'json'
# gem 'json_pure'
# gem 'metadata-json-lint'
# gem 'puppet'
# gem 'puppet-lint-absolute_classname-check'
# gem 'puppet-lint-classes_and_types_beginning_with_digits-check'
# gem 'puppet-lint-leading_zero-check'
# gem 'puppet-lint-resource_reference_syntax'
# gem 'puppet-lint-trailing_comma-check'
# gem 'puppet-lint-unquoted_string-check'
# gem 'puppet-lint-version_comparison-check'
gem "puppet-module-posix-default-r#{minor_version}"
# gem 'puppet-strings'
# gem 'puppetlabs_spec_helper'
# gem 'rake'
# gem 'rgen'
# gem 'rspec'
# gem 'rspec-puppet'
# gem 'rspec-puppet-facts'
# gem 'rubocop'
gem 'rugged'
# gem 'semantic_puppet'
# gem 'simplecov'
# gem 'simplecov-console'
# gem 'yard'

group :development do
  # gem 'guard-rake'
  gem "puppet-module-posix-dev-r#{minor_version}"
  # gem 'travis'
  # gem 'travis-lint'
end

group :acceptance do
  gem "puppet-module-posix-system-r#{minor_version}"
#   gem 'beaker', '~>4.0'
#   gem 'beaker-docker'
#   gem 'beaker-hiera'
#   gem 'beaker-hostgenerator'
#   gem 'beaker-module_install_helper'
#   gem 'beaker-puppet'
#   gem 'beaker-puppet_install_helper'
#   gem 'beaker-rspec'
  gem 'beaker-testmode_switcher'
end

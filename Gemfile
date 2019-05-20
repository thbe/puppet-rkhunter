source ENV['GEM_SOURCE'] || "https://rubygems.org"

# calculate the current ruby version
ruby_version_segments = Gem::Version.new(RUBY_VERSION.dup).segments
minor_version = "#{ruby_version_segments[0]}.#{ruby_version_segments[1]}"

group :development do
  gem 'coveralls'
  gem 'github_changelog_generator'
  gem 'json_pure'
  gem "puppet-module-posix-default-r#{minor_version}"
  gem "puppet-module-posix-dev-r#{minor_version}"
  gem 'rugged'
end

group :acceptance do
  gem "puppet-module-posix-system-r#{minor_version}"
  gem 'beaker-testmode_switcher'
end

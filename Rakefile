require 'rubygems'
require 'bundler/setup'
require 'uri'
require 'rugged'
require 'semantic_puppet'

require 'puppet/version'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet-lint/tasks/puppet-lint'

require 'rubocop/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'

exclude_paths = [
  "bundle/**/*",
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

PuppetLint.configuration.log_format = '%{path}:%{line}:%{check}:%{KIND}:%{message}'
PuppetLint.configuration.relative = true
PuppetLint.configuration.disable_80chars
PuppetLint.configuration.absolute_classname_reverse = true
PuppetLint.configuration.disable_class_inherits_from_params_class
PuppetLint.configuration.disable_class_parameter_defaults
PuppetLint.configuration.fail_on_warnings = true

Rake::Task[:lint].clear

desc 'RuboCop checks'
task 'rubocop_checks' do
  RuboCop::RakeTask.new
end

desc 'Auto-correct puppet-lint offenses'
task 'lint:auto_correct' do
  Rake::Task[:lint_fix].invoke
end

desc 'Run acceptance tests'
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc 'Check for trailing whitespace'
task :trailing_whitespace do
  Dir.glob('**/*.md', File::FNM_DOTMATCH).sort.each do |filename|
    next if filename =~ %r{^((modules|acceptance|\.?vendor|spec/fixtures|pkg)/|REFERENCE.md)}

    File.foreach(filename).each_with_index do |line, index|
      if line =~ %r{\s\n$}
        puts "#{filename} has trailing whitespace on line #{index + 1}"
        exit 1
      end
    end
  end
end

desc "Run main 'test' task and report merged results to coveralls"
task test_with_coveralls: [:test] do
  if Dir.exist?(File.expand_path('lib', __dir__))
    require 'coveralls/rake/task'
    Coveralls::RakeTask.new
    Rake::Task['coveralls:push'].invoke
  else
    puts 'Skipping reporting to coveralls.  Module has no lib dir'
  end
end

desc "Populate CONTRIBUTORS file"
task :contributors do
  system("git log --format='%aN' | sort -u > CONTRIBUTORS")
end

desc 'Generate REFERENCE.md'
task :reference, [:debug, :backtrace] do |t, args|
  patterns = ''
  Rake::Task['strings:generate:reference'].invoke(patterns, args[:debug], args[:backtrace])
end

desc 'Generate changelog'
task :changelog do
  @repo   = Rugged::Repository.new(Dir.pwd)
  remote = URI(@repo.remotes['origin'].url).path.split('/')
  github_user    = remote[1]
  github_project = remote[2][0..-5]
  changelog_generator_command = "github_changelog_generator " + github_user + "/" + github_project
  system(changelog_generator_command)
end

desc "Run syntax, lint, and spec tests."
task :test => %i[
  rubocop_checks
  metadata_lint
  syntax
  lint
  spec
  spec/acceptance
]

desc "Create documentation"
task :documentation => %i[
  strings:generate
  reference
  contributors
  changelog
]

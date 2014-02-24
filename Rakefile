require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.ignore_paths = [ 'spec/fixtures/**/*.pp' ]
task :default => [ :lint, :spec ]

require 'rake'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'
#require 'puppet-lint'

PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

desc "Validate manifests, templates, and ruby files"
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end

  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end

  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end

  desc "Run lint check on puppet manifests"
  linter =  PuppetLint.new
  Dir.glob('./manifists//**/*.pp').each do |puppet_file|
    puts "Evaluating #{puppet_file}"
    linter.file = puppet_file
    linter.run
  end
  fail if linter.errors?
end

RSpec::Core::RakeTask.new(:test) do |t|
   t.pattern = 'spec/*/*_spec.rb'
end

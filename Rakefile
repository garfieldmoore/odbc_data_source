require 'rake'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'
require 'puppet-lint'
require 'puppet-lint/tasks/puppet-lint'

#PuppetLint::Plugins.load_spec_helper

PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp", "packages/**/**.pp"]

desc "Validate manifests, templates, and ruby files"
task :checks do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end

  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end

  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

task :validate => [:checks, :lint]

RSpec::Core::RakeTask.new(:test) do |t|
   t.pattern = './spec/*_spec.rb'
end

task :apply do

  Dir['examples/**/*.pp'].each do |manifest|
    sh "puppet apply --noop #{manifest} --modulepath .."
  end

end

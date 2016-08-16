require 'rubygems'
require 'puppet-lint'
require 'puppetlabs_spec_helper/module_spec_helper'

PuppetLint::Plugins.load_spec_helper

RSpec.configure do |c|
  c.module_path = "modules"
  c.manifest_dir= 'manifests'
end

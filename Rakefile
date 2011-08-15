#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'jeog/version'

task :build do
  system "gem build jeog.gemspec"
end

task :install => :build do
  system "gem install jeog-#{Jeog::VERSION}.gem"
end

task :release => :build do
  system "git tag -a #{Jeog::VERSION} -m 'Tagging #{Jeog::VERSION}'"
  system "git push --tags"
  system "gem push jeog-#{Jeog::VERSION}.gem"
  system "rm jeog-#{Jeog::VERSION}.gem"
end

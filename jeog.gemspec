lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'jeog/version'

Gem::Specification.new do |s|
  s.name = 'jeog'
  s.version = Jeog::VERSION
  s.authors = ['Jason Coene']
  s.email = ['jcoene@gmail.com']
  s.homepage = 'http://github.com/jcoene/jeog'
  s.summary = 'A simple gem to handle jeog files.'
  s.description = 'Handles the opening and parsing of Jeog files.'

  s.add_dependency 'trollop', '~> 1.16.2'
  s.add_dependency 'multi_json', '~> 1.0.3'

  s.files = Dir["bin/*"] + Dir["lib/**/*"] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.executables = ['jeog']
  s.require_path = 'lib'
end

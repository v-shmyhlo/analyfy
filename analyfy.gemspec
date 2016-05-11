# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'analyfy/version'

Gem::Specification.new do |spec|
  spec.name          = 'analyfy'
  spec.version       = Analyfy::VERSION
  spec.authors       = ['George Zhukov']
  spec.email         = ['george@rubygarage.org']

  spec.summary       = 'Code Analysis tool'
  spec.description   = 'Code Analysis tool'
  spec.homepage      = 'https://rubygarage.org/'
  spec.license       = ''

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ''
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop'
  spec.add_dependency 'rails_best_practices'
  spec.add_dependency 'rubycritic'
  spec.add_dependency 'brakeman'
  spec.add_dependency 'commander'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
end

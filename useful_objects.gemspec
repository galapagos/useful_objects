# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'useful_objects/version'

Gem::Specification.new do |spec|
  spec.name          = 'useful_objects'
  spec.version       = UsefulObjects::VERSION
  spec.authors       = ['k-motoyan']
  spec.email         = ['k.motoyan888@gmail.com']

  spec.summary       = 'Extensions for ruby standard classes.'
  spec.homepage      = 'https://github.com/galapagos/useful_objects.git'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop', '~> 0.38.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'
end

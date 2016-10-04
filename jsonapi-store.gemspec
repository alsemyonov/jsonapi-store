# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonapi/store/version'

Gem::Specification.new do |spec|
  spec.name = 'jsonapi-store'
  spec.version = JSONAPI::Store::VERSION
  spec.authors = ['Alex Semyonov']
  spec.email = ['alex@semyonov.us']

  spec.summary = 'JSON API Data Store'
  spec.description = <<-DESCRIPTION
Data Store for implementing JSON API-compliant server in Ruby.
  DESCRIPTION
  spec.homepage = 'https://github.com/alsemyonov/jsonapi-store'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.12.0'
  spec.add_development_dependency 'simplecov-html', '~> 0.10.0'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'rubocop', '~> 0.43.0'
  spec.add_development_dependency 'yard', '~> 0.9.5'
  spec.add_development_dependency 'redcarpet', '~> 3.3.4'
end

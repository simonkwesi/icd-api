# frozen_string_literal: true

require_relative 'lib/icd/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'icd-api'
  spec.version       = Icd::Api::VERSION
  spec.authors       = ['Simon Kunz']
  spec.email         = ['sku@mtomady.de']

  spec.summary       = 'Summary'
  spec.description   = 'Desc'
  spec.homepage      = 'https://www.github.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.0')

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://www.github.com'
  spec.metadata['changelog_uri'] = 'https://www.github.com'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('faraday', '>= 1.7')

  # gem.add_development_dependency "bundler"
  spec.add_development_dependency 'base64'
  spec.add_development_dependency 'bigdecimal'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.metadata['rubygems_mfa_required'] = 'true'
end

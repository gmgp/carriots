# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carriots/version'

Gem::Specification.new do |spec|
  spec.name          = 'carriots'
  spec.version       = Carriots::VERSION
  spec.authors       = ['Giovanni Messina']
  spec.email         = ['gmgp.info@gmail.com']

  spec.summary       = 'carriots api wrapper'
  spec.description   = 'carriots api wrapper'
  spec.homepage      = 'http://github.com/gmgp/carriots'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(/test/) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.11'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'vcr',      '~> 3.0'
  spec.add_development_dependency 'webmock',  '~>1.24'

  spec.add_dependency 'faraday', '~>0.9'
end

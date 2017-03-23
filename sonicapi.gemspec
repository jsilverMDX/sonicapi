# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sonicapi/version'

Gem::Specification.new do |spec|
  spec.name          = "sonicapi"
  spec.version       = SonicApi::VERSION
  spec.authors       = ["Anthony Erlinger"]
  spec.email         = ["aerlinger@gmail.com"]
  spec.summary       = %q{SonicAPI library}
  spec.description   = %q{SonicAPI library for Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

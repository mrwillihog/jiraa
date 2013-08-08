# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jiraa/version'

Gem::Specification.new do |spec|
  spec.name          = "jiraa"
  spec.version       = Jiraa::VERSION
  spec.authors       = ["Matthew Williams"]
  spec.email         = ["m.williams@me.com"]
  spec.description   = %q{A CLI for the Jira 5 REST API}
  spec.summary       = %q{A CLI for the Jira 5 REST API...}
  spec.homepage      = "https://github.com/mrwillihog/jiraa"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "jira_client", ">= 1.0.2"
  spec.add_runtime_dependency "gli", "2.5.6"
  spec.add_runtime_dependency "colorize", "0.5.8"
end

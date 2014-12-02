# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snails/version'

Gem::Specification.new do |spec|
  spec.name          = "snails"
  spec.version       = Snails::VERSION
  spec.authors       = ["Cody Duval"]
  spec.email         = ["cody.duval@gmail.com"]
  spec.summary       = %q{YARWF (Yet Another Rack Web Framework)}
  spec.description   = %q{This is a slow, non-performant, unoptimized web
                          framework written for fun.  Please don't use it
                          in any production or otherwise important 
                          environment. I've mirrored Rails' architecture, so
                          maybe just go use that instead.}
  spec.homepage      = "http://www.codyduval.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack", "~> 1.5"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rack-test", "~> 0.6"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'madlibber/version'

Gem::Specification.new do |spec|
  spec.name          = "madlibber"
  spec.version       = Madlibber::VERSION
  spec.authors       = ["Sam Samskies"]
  spec.email         = ["samprofessional@gmail.com"]
  spec.description   = %q{Turns any chunk of text into a Mad Lib.}
  spec.summary       = %q{Turns any chunk of text into a Mad Lib}
  spec.homepage      = "https://github.com/SamSamskies/madlibber"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_dependency "engtagger"
end

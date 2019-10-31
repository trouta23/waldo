# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waldo/version'

Gem::Specification.new do |spec|
  spec.name          = "waldo"
  spec.version       = Waldo::VERSION
  spec.authors       = ["Austin Trout"]
  spec.email         = ["trouta23@gmail.com"]

  spec.summary       = %q{Waldo is used to learn about making your own gem}
  spec.homepage      = "https://github.com/trouta23/waldo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0.2"
  spec.add_development_dependency "rake", "~> 10.0"
end

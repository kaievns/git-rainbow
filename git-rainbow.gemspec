# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_rainbow/version'

Gem::Specification.new do |spec|
  spec.name          = "git-rainbow"
  spec.version       = GitRainbow::VERSION
  spec.authors       = ["Nikolay Nemshilov"]
  spec.email         = ["nemshilov@gmail.com"]

  spec.summary       = "A git extension that makes rainbows"
  spec.description   = "A git extension that makes rainbows. Like totally!"
  spec.homepage      = "https://github.com/MadRabbit/git-rainbow"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
end

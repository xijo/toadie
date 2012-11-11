# -*- encoding: utf-8 -*-
require File.expand_path('../lib/toadie/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Johannes Opper"]
  gem.email         = ["xijo@gmx.de"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "toadie"
  gem.require_paths = ["lib"]
  gem.version       = Toadie::VERSION

  gem.add_runtime_dependency 'slop', '~> 3.3.3'
  gem.add_runtime_dependency 'slim'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
end

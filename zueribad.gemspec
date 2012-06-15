# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zueribad/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["koffeinfrei"]
  gem.email         = ["mail@koffeinfrei.org"]
  gem.description   = %q{displays the temperature and additional information about all public baths in zurich}
  gem.summary       = %q{cli or the zueribad api}
  gem.homepage      = "https://github.com/koffeinfrei/zueribad-rb"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zueribad"
  gem.require_paths = ["lib"]
  gem.version       = Zueribad::VERSION
end

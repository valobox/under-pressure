# -*- encoding: utf-8 -*-
require File.expand_path('../lib/under-pressure/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamie Blair" "Oliver Brooks"]
  gem.email         = ["jamie@valobox.com"]
  gem.description   = "Compress png and jpg images"
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "under-pressure"
  gem.require_paths = ["lib"]
  gem.version       = Under::Pressure::VERSION
end

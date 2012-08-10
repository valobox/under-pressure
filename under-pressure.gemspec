# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'under_pressure/version'

Gem::Specification.new do |gem|
  gem.name          = "under-pressure"
  gem.version       = UnderPressure::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Jamie Blair" "Oliver Brooks"]
  gem.email         = ["jamie@valobox.com"]
  gem.description   = "Compress png and jpg images"
  gem.summary       = ""
  gem.homepage      = "https://github.com/completelynovel/under-pressure"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.files         = Dir.glob("{lib}/**/*") + %w(README.md)

  gem.add_dependency "open4"
end

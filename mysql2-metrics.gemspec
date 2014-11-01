Gem::Specification.new do |spec|
  spec.name          = "mysql2-metrics"
  spec.version       = "0.0.1"
  spec.authors       = ["sonots"]
  spec.email         = ["sonots@gmail.com"]
  spec.summary       = %q{Instrument mysql2 queries}
  spec.description   = %q{Instrument mysql2 queries}
  spec.homepage      = "https://github.com/sonots/mysql2-metrics"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mysql2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

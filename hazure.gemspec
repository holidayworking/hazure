
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hazure/version'

Gem::Specification.new do |spec|
  spec.name          = 'hazure'
  spec.version       = Hazure::VERSION
  spec.authors       = ['Hidekazu Tanaka']
  spec.email         = ['hidekazu.tanaka@gmail.com']

  spec.summary       = 'Outlier Detection with One-class SVM'
  spec.description   = 'Outlier Detection with One-class SVM'
  spec.homepage      = 'https://github.com/holidayworking/hazure'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'rb-libsvm', '~> 1.4.0'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'guard', '~> 2.13.0'
  spec.add_development_dependency 'guard-bundler', '~> 2.1.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.6.0'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2.0'
  spec.add_development_dependency 'pry', '~> 0.10.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.0'
end

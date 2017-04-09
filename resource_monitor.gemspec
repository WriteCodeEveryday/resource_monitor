# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resource_monitor/version'

Gem::Specification.new do |spec|
  spec.name          = "resource_monitor"
  spec.version       = ResourceMonitor::VERSION
  spec.authors       = ["Lazaro Herrera"]
  spec.email         = ["lazherrera@gmail.com"]

  spec.summary       = %q{A Rails 5 ActionCable gem for simple resource usage monitoring.}
  spec.description   = %q{This gem creates a dashboard for monitoring of ongoing CPU/RAM usage of your processes.}
  spec.homepage      = "http://writecodeeveryday.github.io/projects/resource_monitor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "actioncable"
end

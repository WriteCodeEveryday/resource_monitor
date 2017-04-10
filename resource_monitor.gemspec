$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resource_monitor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "resource_monitor"
  s.version       = ResourceMonitor::VERSION
  s.authors       = ["Lazaro Herrera"]
  s.email         = ["lazherrera@gmail.com"]
  s.summary       = %q{A Rails 5 ActionCable gem for simple resource usage monitoring.}
  s.description   = %q{This gem creates a dashboard for monitoring of ongoing CPU/RAM usage of your processes.}
  s.homepage      = "http://writecodeeveryday.github.io/projects/resource_monitor"
  s.license       = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 5.0.2"
  s.add_dependency "bundler", "~> 1.14"
  s.add_dependency "rake", "~> 10.0"
  s.add_dependency "actioncable"
end

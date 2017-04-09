require "bundler/gem_tasks"
task :default => :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'resource_monitor' # You know what to do.
  ARGV.clear
  IRB.start
end

namespace :resource_monitor do
  task :console do
    require 'irb'
    require 'irb/completion'
    require 'resource_monitor' # You know what to do.
    ARGV.clear
    IRB.start
  end

  task :setup do
    puts "This should contain a setup in the future that copies the stuff from app into the local project."
  end
end

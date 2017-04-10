namespace :resource_monitor do
  # Works perfectly as a quick test environment.
  task :console do
    # require 'irb'
    # require 'irb/completion'
    # require 'resource_monitor' # You know what to do.
    # ARGV.clear
    # IRB.start
    puts "This functionality is broken in engine mode. Research further."
  end

  # Works correctly.
  task :install_dashboard do
    if defined?(Rails)
      puts "Add the following to your routes/config.rb\n"
      puts "mount ResourceMonitor::Engine => '/resources'"
    else
      puts "This installer should be run inside a Rails project."
    end
  end

  # Does nothing at all.
  task :uninstall_dashboard do
    if defined?(Rails)
      puts "Remove the following to your routes/config.rb\n"
      puts "mount ResourceMonitor::Engine => '/resources'"
    else
      puts "This uninstaller should be run inside a Rails project."
    end
  end
end

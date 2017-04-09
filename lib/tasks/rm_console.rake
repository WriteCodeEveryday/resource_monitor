namespace :resource_monitor do
  task :console do
    require 'irb'
    require 'irb/completion'
    require 'resource_monitor' # You know what to do.
    ARGV.clear
    IRB.start
  end

  task :install_dashboard do
    if defined?(Rails)
      records = Dir.glob("app/**/**").select { |f| File.file?(f) }
      puts records
      puts "Remember to add the following route to your config/routes.rb"
      puts "get 'resources' => 'resource#index'"
    else
      puts "This installer should be run inside a Rails project."
    end
  end

  task :uninstall_dashboard do
    if defined?(Rails)
      records = Dir.glob("app/**/**").select { |f| File.file?(f) }
      puts records
      puts "Remember to remove the following route from your config/routes.rb"
      puts "get 'resources' => 'resource#index'"
    else
      puts "This uninstaller should be run inside a Rails project."
    end
  end
end

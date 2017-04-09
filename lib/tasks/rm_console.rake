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
      path = Gem.loaded_specs['resource_monitor'].full_gem_path
      records = Dir.glob("#{path}/app/**/**").select { |f| File.file?(f) }
      records.each do |item|
        puts item.split(path)[1]
      end
      puts "Remember to add the following route to your config/routes.rb"
      puts "get 'resources' => 'resource#index'"
    else
      puts "This installer should be run inside a Rails project."
    end
  end

  task :uninstall_dashboard do
    if defined?(Rails)
      path = Gem.loaded_specs['resource_monitor'].full_gem_path
      records = Dir.glob("#{path}app/**/**").select { |f| File.file?(f) }
      records.each do |item|
        puts item.split(path)[1]
      end
      puts "Remember to remove the following route from your config/routes.rb"
      puts "get 'resources' => 'resource#index'"
    else
      puts "This uninstaller should be run inside a Rails project."
    end
  end
end

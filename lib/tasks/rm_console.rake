namespace :resource_monitor do
  # Works perfectly as a quick test environment.
  task :console do
    require 'irb'
    require 'irb/completion'
    require 'resource_monitor' # You know what to do.
    ARGV.clear
    IRB.start
  end

  # Works correctly.
  task :install_dashboard do
    if defined?(Rails)
      path = Gem.loaded_specs['resource_monitor'].full_gem_path
      puts "Copying from #{path}/app/ to #{Rails.root.to_s}/app/"
      FileUtils.cp_r "#{path}/app/.", "#{Rails.root.to_s}/app/"
      puts "IMPORTANT: Remember to add the following route to your config/routes.rb"
      puts "get '/resources/' => 'resource#index'"
    else
      puts "This installer should be run inside a Rails project."
    end
  end

  # Does nothing at all.
  task :uninstall_dashboard do
    if defined?(Rails)
      path = Gem.loaded_specs['resource_monitor'].full_gem_path
      records = Dir.glob("#{path}app/**/**").select { |f| File.file?(f) }
      puts "These are the files we think should be removed"
      puts records
      records.each do |item|
        puts "Removing #{Rails.root.to_s}#{item.split(path)[1]}"
        FileUtils.rm "#{Rails.root.to_s}#{item.split(path)[1]}"
      end
      puts "IMPORTANT: Remember to remove the following route from your config/routes.rb"
      puts "get '/resources/' => 'resource#index'"
    else
      puts "This uninstaller should be run inside a Rails project."
    end
  end
end

class ResourceMonitor::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/rm_console.rake'
  end
end

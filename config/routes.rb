ResourceMonitor::Engine.routes.draw do
  namespace :resource_monitor do
    get '/resources/' => 'resource#index'
  end
end

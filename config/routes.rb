ResourceMonitor::Engine.routes.draw do
  namespace :resource_monitor do
    get '/' => 'resource#index'
  end
end

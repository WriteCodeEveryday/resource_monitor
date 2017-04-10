ResourceMonitor::Engine.routes.draw do
  get '/' => 'resource_monitor/resource#index'
end

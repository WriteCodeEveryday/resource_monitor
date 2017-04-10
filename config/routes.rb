ResourceMonitor::Engine.routes.draw do
  get '/' => 'engine/resource_monitor/resource#index'
end

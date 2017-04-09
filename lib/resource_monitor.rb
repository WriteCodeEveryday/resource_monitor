require "resource_monitor/version"
require "resource_monitor/railtie" if defined?(Rails)

module ResourceMonitor
  def self.benchmark(controller=nil)
    # Recover the process id and memory usage in KB (http://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage)
    pid, size, cpu_per, mem_per = `ps ax -o pid,rss,%cpu,%mem | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)

    if defined?(Rails)
      last_executed_controller = controller&.controller_name.presence  || controller&['controller_name'].presence  || 'NoController'
      last_executed_action = controller&.action_name.presence || controller&['action_name'].presence || 'NoAction'
    else
      last_executed_controller = controller&.controller_name ||  'NoController'
      last_executed_action = controller&.action_name || 'NoAction'
    end
    
    data = {
      process_id: pid,
      cpu_percentage: cpu_per,
      ram_percentage: mem_per,
      ram_usage: (size / 1024).to_i,
      last_executed_line: caller[2]|| "NoCallerData", # Skip two so this is not triggered on Application.before_action
      last_executed_controller: last_executed_controller,
      last_executed_action: last_executed_action
    }

    ActionCable.server.broadcast 'resources', data.to_json if defined?(ActionCable)
    return data
  end
end

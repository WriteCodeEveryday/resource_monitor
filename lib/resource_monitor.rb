require "resource_monitor/engine"
require "resource_monitor/version"

module ResourceMonitor
  def self.benchmark(input=nil)
    # Recover the process id and memory usage in KB (http://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage)
    pid, size, cpu_per, mem_per = `ps ax -o pid,rss,%cpu,%mem | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)

    if input
      if input.instance_of(ActionController)
        details = "Controller: #{input.controller_name}\nAction: #{input.action_name}"
      elsif input.instance_if(ActiveRecord)
        details = "Model: #{input.model_name.human}"
      end
    else
      details = "No details available"
    end

    data = {
      process_id: pid,
      cpu_percentage: cpu_per,
      ram_percentage: mem_per,
      ram_usage: (size / 1024).to_i,
      details: details
    }

    ActionCable.server.broadcast 'resources', data.to_json if defined?(ActionCable)
    return data
  end
end

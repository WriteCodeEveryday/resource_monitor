class ResourceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "resources"
    ResourceMonitor.benchmark({controller_name: 'actioncable', controller_action: 'subscribed'})
  end

  def receive(data)
    if data['type'] == "request"
      ResourceMonitor.benchmark({controller_name: 'actioncable', controller_action: 'receive'})
    end
  end
end

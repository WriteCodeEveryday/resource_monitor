class ResourceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "resources"
    ResourceMonitor.benchmark()
  end

  def receive(data)
    if data['type'] == "request"
      ResourceMonitor.benchmark()
    end
  end
end

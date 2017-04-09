class ResourceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "resources"
    ResourceMonitor.benchmark()
  end
end

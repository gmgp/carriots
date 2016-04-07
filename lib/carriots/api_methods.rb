# api_methods.rb
require_relative './api_calls'
require_relative './api_entities/streams'

module Carriots
  # Connecction options for {Client}
  #
  module ApiMethods
    include ApiCalls
    include ApiEntities

    def streams(options = {}, *args)
      @streams ||= Streams.new(response: call_streams(options, *args))
    end

    def streams!(options = {}, *args)
      @streams = Streams.new(response: call_streams(options, *args))
    end

    def stream(device = default_device, *args)
      call_stream(device, *args)
    end
  end
end

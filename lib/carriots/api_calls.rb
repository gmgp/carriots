# api_methods.rb
require_relative './api_calls/streams_options'

module Carriots
  # Connecction options for {Client}
  #
  module ApiCalls
    def call_streams(options = {}, *args)
      build_options = StreamsOptions.new(options).build_options

      get("streams/#{build_options}", *args)
    end

    def call_stream(device = default_device, *args)
      get("streams/#{device}", *args)
    end
  end
end

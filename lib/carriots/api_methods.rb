# api_methods.rb
require_relative './api_methods/streams_options'

module Carriots
  # Connecction options for {Client}
  #
  module ApiMethods
    def streams(options = {}, *args)
      build_options = StreamsOptions.new(options).build_options

      get("streams/#{build_options}", *args)
    end

    def stream(device = default_device, *args)
      get("streams/#{device}", *args)
    end
  end
end

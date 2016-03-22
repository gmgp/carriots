# client.rb
require 'carriots/configurable'
require 'carriots/connection'
require 'carriots/api_methods'

module Carriots
  # Client for the Carriot API
  #
  # @see https://www.carriots.com/documentation/api
  class Client
    include Carriots::Configurable
    include Carriots::Connection
    include Carriots::ApiMethods

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Carriots::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] ||
          Carriots.instance_variable_get(:"@#{key}"))
      end
    end

    # Text representation of the client, masking api_keys
    #
    # @return [String]
    def inspect
      inspected = super

      # mask api_keys
      # inspected = inspected.gsub! @write_api_key, "*******" if @write_api_key
      # Only show last 4 of token, secret
      if @write_api_key
        inspected = inspected.gsub! @write_api_key, revele_last_n_digit(@write_api_key)
      end

      inspected
    end

    def default_device
      "defaultDevice@#{login}.#{login}"
    end

    private

    def revele_last_n_digit(string, n = 5)
      ('*' * (string.size - n)) + string.reverse[0, n].reverse.to_s
    end
  end
end

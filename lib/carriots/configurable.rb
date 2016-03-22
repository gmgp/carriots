require 'carriots/default'

# configurable.rb
module Carriots
  # Configuration options for {Client}, defaulting to values
  # in {Default}
  module Configurable
    # @!attribute api_endpoint
    #   @return [String] Base URL for API requests. default: https://api.carriots.com/
    # @!attribute default_media_type
    #   @see https://www.carriots.com/documentation/api/rest_api_headers
    #   @return [String] Configure preferred media type (for API versioning, for example)
    # @!attribute connection_options
    #   @see https://github.com/lostisland/faraday
    #   @return [Hash] Configure connection options for Faraday
    # @!attribute [w] write_api_key
    #   @return [String] Carriots api key for whit write access
    # @!attribute user_agent
    #   @return [String] Configure User-Agent header for requests.
    # @!attribute web_endpoint
    #   @return [String] Base URL for web URLs. default: https://github.com/

    attr_accessor :default_media_type, :connection_options, :user_agent, :login
    attr_writer :web_endpoint, :api_endpoint, :write_api_key

    class << self
      # List of configurable keys for {Carriots::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :api_endpoint,
          :connection_options,
          :default_media_type,
          :user_agent,
          :web_endpoint,
          :login,
          :write_api_key
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      Carriots::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Carriots::Default.options[key])
      end
      self
    end
    alias setup reset!

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    def api_endpoint
      @api_endpoint.to_s
    end

    # Base URL for generated web URLs
    #
    # @return [String] Default: https://carriots.com/
    def web_endpoint
      @web_endpoint.to_s
    end

    def write_api_key
      @write_api_key.to_s
    end

    private

    def options
      Hash[Carriots::Configurable.keys.map { |key| [key, instance_variable_get(:"@#{key}")] }]
    end
  end
end

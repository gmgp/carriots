# default.rb

module Carriots
  # Default configuration options for {Client}
  #
  module Default
    # Default API endpoint
    API_ENDPOINT = 'https://api.carriots.com'.freeze

    # Default User Agent header string
    USER_AGENT   = "Carriots Ruby Gem #{Carriots::VERSION}".freeze

    # Default media type
    MEDIA_TYPE   = 'application/vnd.carriots.v2+json'.freeze

    # Default WEB endpoint
    WEB_ENDPOINT = 'https://carriots.com'.freeze

    # # In Faraday 0.9, Faraday::Builder was renamed to Faraday::RackBuilder
    # RACK_BUILDER_CLASS = defined?(Faraday::RackBuilder) ? Faraday::RackBuilder : Faraday::Builder

    class << self
      # Configuration options
      # @return [Hash]
      def options
        Hash[Carriots::Configurable.keys.map { |key| [key, send(key)] }]
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['CARRIOTS_API_ENDPOINT'] || API_ENDPOINT
      end

      # Default options for Faraday::Connection
      # @return [Hash]
      def connection_options
        {
          headers: {
            accept: default_media_type,
            user_agent: user_agent
          }
        }
      end

      # Default media type from ENV or {MEDIA_TYPE}
      # @return [String]
      def default_media_type
        ENV['CARRIOTS_DEFAULT_MEDIA_TYPE'] || MEDIA_TYPE
      end

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['CARRIOTS_USER_AGENT'] || USER_AGENT
      end

      # Default web endpoint from ENV or {WEB_ENDPOINT}
      # @return [String]
      def web_endpoint
        ENV['CARRIOTS_WEB_ENDPOINT'] || WEB_ENDPOINT
      end

      # Default write api key from ENV
      # @return [String]
      def write_api_key
        ENV['CARRIOTS_WRITE_API_KEY']
      end
    end
  end
end

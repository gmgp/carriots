# connection.rb
require 'faraday_middleware'

module Carriots
  # Connecction options for {Client}
  #
  module Connection
    def connection
      @connection ||= begin

        conn = Faraday.new(api_endpoint, connection_options) do |b|
          b.request  :json
          b.response :json, content_type: /\bjson$/
          b.use FaradayMiddleware::FollowRedirects

          # b.use :instrumentation
          b.adapter Faraday.default_adapter
        end
        conn.headers['carriots.apiKey'] = write_api_key

        conn
      end
    end

    def get(path, params = nil)
      connection.get(path) do |request|
        request.params = params if params
      end
    end
  end
end

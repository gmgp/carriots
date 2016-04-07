# streams.rb
require_relative './base'
require_relative './data_stream'

module Carriots
  #
  #
  module ApiEntities
    # Streams entity for Carriots API
    #
    class Streams < Base
      attr_reader :total_documents
      attr_reader :result

      def initialize(options = {}, *args)
        super
        parse_response if status == 200
      end

      def parse_response
        @total_documents = body['total_documents']
        @result          = body['result'].map { |i| DataStream.new(i) }
      end
    end
  end
end

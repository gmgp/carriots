# streams.rb

module Carriots
  #
  #
  module ApiEntities
    # Data Stream entity for Carriots API
    #
    class DataStream
      attr_reader :_id
      attr_reader :protocol
      attr_reader :_t
      attr_reader :at
      attr_reader :persist
      attr_reader :device
      attr_reader :data
      attr_reader :id_developer
      attr_reader :created_at
      attr_reader :owner

      def initialize(result = {})
        @_id           = result['_id']
        @protocol      = result['protocol']
        @_t            = result['_t']
        @persist       = result['persist']
        @device        = result['device']
        @data          = result['data']
        @id_developer  = result['id_developer']
        @owner         = result['owner']
        @at            = Time.at(result['at'])         if result['at']
        @created_at    = Time.at(result['created_at']) if result['created_at']
      end
    end
  end
end

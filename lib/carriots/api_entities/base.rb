# base.rb

module Carriots
  #
  #
  module ApiEntities
    # base empty entity for Carriots API
    #
    class Base
      extend Forwardable

      attr_reader :raw_options
      attr_reader :response

      def initialize(options = {})
        @raw_options = options
        @response = options[:response]
      end

      def_delegator :response, :body
      def_delegator :response, :status
      def_delegator :response, :headers
    end
  end
end

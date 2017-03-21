
# connection.rb
module Carriots

  module Errors 

    class ConnectionError < StandardError
      def initialize(status,reason_phrase)
        @status = status
        @reason_phrase = reason_phrase
      end
      
      def status 
        @status
      end

      def reason_phrase
        @reason_phrase
      end
    end

  end
end

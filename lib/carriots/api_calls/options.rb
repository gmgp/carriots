# options.rb

module Carriots
  # Connecction options for {Client}
  #
  module ApiCalls
    # general options for Carriots API
    #
    class Options
      attr_accessor :options
      attr_accessor :build_options

      def initialize(options = {})
        @raw_options = options
        @options = []
        set_options
        @build_options = opts_montati
      end

      def raw
        @raw_options
      end

      def keys
        []
      end

      def set_options
        keys.each { |key| send("param_#{key}", raw[key]) }
      end

      def opts_montati
        return '' if @options.empty?

        '?' + @options.join('&')
      end

      private

      def set_param(key, value)
        @options << "#{key}=#{value}"
      end

      def set_time_param(key, value)
        v = (value.is_a?(Fixnum) ? value : value.to_time.to_i)
        set_param(key, v)
      end
    end
  end
end

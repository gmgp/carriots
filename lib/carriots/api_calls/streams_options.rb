require_relative './options'
# streams_options.rb

module Carriots
  # Connecction options for {Client}
  #
  module ApiCalls
    # options for /streams/ carriots API
    #
    class StreamsOptions < Options
      def keys
        [:device, :_t, :at, :at_to, :at_from, :max, :offset, :created_at, :created_at_to, :created_at_from]
      end

      private

      def param__t(value = nil)
        set_param(:_t, value) if value && %w(sta str).include?(value)
      end

      def param_at(value = nil)
        set_time_param(:at, value) if value
      end

      def param_at_to(value = nil)
        set_time_param(:at_to, value) if value
      end

      def param_at_from(value = nil)
        set_time_param(:at_from, value) if value
      end

      def param_device(value = nil)
        set_param(:device, value) if value
      end

      def param_max(value = nil)
        set_param(:max, value) if value
      end

      def param_offset(value = nil)
        set_param(:offset, value) if value
      end

      def param_created_at(value = nil)
        set_time_param(:created_at, value) if value
      end

      def param_created_at_to(value = nil)
        set_time_param(:created_at_to, value) if value
      end

      def param_created_at_from(value = nil)
        set_time_param(:created_at_from, value) if value
      end
    end
  end
end

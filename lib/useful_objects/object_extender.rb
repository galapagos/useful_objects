module UsefulObjects
  # External Object methods.
  module ObjectExtender
    refine Object do
      def to_bool
        case self
        when TrueClass, FalseClass then self
        when NilClass then false
        when Integer, Float then convert_number_to_bool(self)
        when String then convert_string_to_bool(self)
        else true
        end
      end

      private

      def convert_string_to_bool(value)
        value == 'false' ? false : true
      end

      def convert_number_to_bool(value)
        value == 0 ? false : true
      end
    end
  end
end

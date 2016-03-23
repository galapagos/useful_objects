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

      def conditional_method(name)
        instance_var_name = :"@original_#{name}"

        unless instance_variable_defined? instance_var_name
          instance_variable_set instance_var_name, method(name)
        end

        define_singleton_method(name) do |*args|
          return unless yield(self)
          original_method = instance_variable_get instance_var_name
          proc_exec original_method, args
        end
      end

      private

      def convert_string_to_bool(value)
        value == 'false' ? false : true
      end

      def convert_number_to_bool(value)
        value == 0 ? false : true
      end

      def proc_exec(proc, args)
        if args.empty?
          proc.call
        else
          proc.call(*args)
        end
      end
    end
  end
end

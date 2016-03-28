module UsefulObjects
  # External Iterator methods.
  module IteratorExtender
    refine Enumerator do
      def map_with_object(arg, proc = nil, &block)
        raise ArgumentError if !block_given? && proc.nil?

        if block_given?
          each_with_object(arg).map(&block)
        else
          each_with_object(arg).map(&proc.to_sym)
        end
      end
    end

    refine Array do
      def map_with_object(arg, proc = nil, &block)
        raise ArgumentError if !block_given? && proc.nil?

        if block_given?
          each_with_object(arg).map(&block)
        else
          each_with_object(arg).map(&proc.to_sym)
        end
      end
    end
  end
end

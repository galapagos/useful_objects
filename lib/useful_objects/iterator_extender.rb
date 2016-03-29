module UsefulObjects
  # External Iterator methods.
  module IteratorExtender
    # Iterator common module.
    module Common
      def map_with_object(proc, arg = nil, &block)
        if block_given?
          arg = proc
          each_with_object(arg).map(&block)
        else
          each_with_object(arg).map(&proc.to_sym)
        end
      end
    end

    refine Enumerator do
      include Common
    end

    refine Array do
      include Common
    end
  end
end

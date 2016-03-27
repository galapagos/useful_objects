require 'time'

module UsefulObjects
  # External Time methods.
  module TimeExtender
    refine Time do
      def millisec
        (usec / 1000.0).round
      end
    end

    refine Integer do
      def to_time
        Time.at(self)
      end
    end

    refine Float do
      def to_time
        Time.at(self)
      end
    end
  end
end

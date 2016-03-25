require 'time'

module UsefulObjects
  # External Time methods.
  module TimeExtender
    refine Time do
      def millisec
        (usec / 1000.0).round
      end
    end
  end
end

module UsefulObjects
  # External Date methods.
  module DateExtender
    refine Date do
      def step_by_unit(tail, unit: :day)
        head = dup

        Enumerator.new do |y|
          while head <= tail
            y << head
            head = (unit.to_sym == :week) ? head + 7 : head.send("next_#{unit}")
          end
        end
      end
    end
  end
end

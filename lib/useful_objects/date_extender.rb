module UsefulObjects
  # External Date methods.
  module DateExtender
    refine Date do
      def step_by_unit(tail, unit: :day)
        unit = unit.to_sym
        head = dup

        check_stepable_unit!(unit)

        Enumerator.new do |y|
          while head <= tail
            y << head
            head = (unit == :week) ? head + 7 : head.send("next_#{unit}")
          end
        end
      end

      private

      STEPABLE_UNITS = %i(day week month year).freeze

      def check_stepable_unit!(unit)
        unless STEPABLE_UNITS.include?(unit)
          raise ArgumentError,
                "Assignable unit only #{STEPABLE_UNITS.join(', ')}."
        end
      end
    end
  end
end

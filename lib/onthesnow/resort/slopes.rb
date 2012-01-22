module OnTheSnow
  module Resort
    module Slopes

      def slopes
        @slopes ||= {"beginner" => beginner_slopes, "intermediate" => intermediate_slopes, "advanced" => advanced_slopes, "expert" => expert_slopes} unless dom(:slopes).empty?
      end

      def beginner_slopes
        @beginner_slopes ||= dom(:slopes).search(".beginner").text.split.join unless dom(:slopes).empty?
      end

      def intermediate_slopes
        @intermediate_slopes ||= dom(:slopes).search(".intermediate").text.split.join unless dom(:slopes).empty?
      end

      def advanced_slopes
        @advanced_slopes ||= dom(:slopes).search(".advanced").text.split.join unless dom(:slopes).empty?
      end

      def expert_slopes
        @expert_slopes ||= dom(:slopes).search(".expert").text.split.join unless dom(:slopes).empty?
      end

    end
  end
end

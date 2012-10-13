module OnTheSnow
  module Resort
    module Trails

      def trails
        @trails ||= {"beginner" => beginner_trails, "intermediate" => intermediate_trails, "advanced" => advanced_trails, "expert" => expert_trails} unless dom(:trails).empty?
      end

      def beginner_trails
        @beginner_trails ||= dom(:trails).css(".beginner div")[0].text.cleanup unless dom(:trails).empty?
      end

      def intermediate_trails
        @intermediate_trails ||= dom(:trails).css(".intermediate div")[0].text.cleanup unless dom(:trails).empty?
      end

      def advanced_trails
        @advanced_trails ||= dom(:trails).css(".advanced div")[0].text.cleanup unless dom(:trails).empty?
      end

      def expert_trails
        @expert_trails ||= dom(:trails).css(".expert div")[0].text.cleanup unless dom(:trails).empty?
      end

      private
      def cleanup
        self.gsub(/\s+/, '').gsub(/\n/, '')
      end

    end
  end
end

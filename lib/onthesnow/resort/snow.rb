module OnTheSnow
  module Resort
    module Snow

      def snow
        @snow ||= {"last_24" => last_24, "last_48" => last_48, "last_72" => last_72, "upper_depth" => upper_depth, "middle_depth" => middle_depth, "lower_depth" => lower_depth} unless dom(:snow).empty?
      end

      def last_24
        @last_24 ||= dom(:snow).search(".white_pill")[0].text.split.join.gsub(/\"/, '') unless dom(:snow).empty?
      end

      def last_48
        @last_48 ||= dom(:snow).search(".white_pill")[1].text.split.join.gsub(/\"/, '') unless dom(:snow).empty?
      end

      def last_72
        @last_72 ||= dom(:snow).search(".white_pill")[2].text.split.join.gsub(/\"/, '') unless dom(:snow).empty?
      end

      def upper_depth
        @upper_depth ||= dom(:depths).css(".upper .white_pill")[0].text.gsub(/\"/, '') unless dom(:depths).empty?
      end

      def middle_depth
        @middle_depth ||= dom(:depths).css(".middle .white_pill")[0].text.gsub(/\"/, '') unless dom(:depths).empty?
      end

      def lower_depth
        @lower_depth ||= dom(:depths).css(".lower .white_pill")[0].text.gsub(/\"/, '') unless dom(:depths).empty?
      end

    end
  end
end

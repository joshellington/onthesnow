module OnTheSnow
  module Resort
    module Snow

      def snow
        @snow ||= {"last_24" => last_24, "last_48" => last_48, "last_72" => last_72} unless dom(:snow).empty?
      end

      def last_24
        @last_24 ||= dom(:snow).search(".white_pill")[0].text.split.join unless dom(:snow).empty?
      end

      def last_48
        @last_48 ||= dom(:snow).search(".white_pill")[1].text.split.join unless dom(:snow).empty?
      end

      def last_72
        @last_72 ||= dom(:snow).search(".white_pill")[2].text.split.join unless dom(:snow).empty?
      end

    end
  end
end

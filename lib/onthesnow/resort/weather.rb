module OnTheSnow
  module Resort
    module Weather

      def weather
        @weather ||= {"date" => date, "temperature" => {"f" => degree_in_f, "c" => degree_in_c}, "condition" => condition} unless dom(:weather).empty?
      end

      def date
        @date ||= dom(:weather).search(".today p").first.text unless dom(:weather).empty?
      end

      def degree
        @degree ||= dom(:weather).search(".temperature").first.text unless dom(:weather).empty?
      end

      def degree_in_f
        @degree_in_f ||= degree.split(" / ")[0] unless dom(:weather).empty?
      end

      def degree_in_c
        @degree_in_c ||= degree.split(" / ")[1] unless dom(:weather).empty?
      end

      def condition
        @condition ||= dom(:weather).search(".condition").text unless dom(:weather).empty?
      end

    end
  end
end

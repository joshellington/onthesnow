module OnTheSnow
  module Resort
    module Elevation

      def elevation
        @elevation ||= {"peak" => peak, "height_difference" => height_difference, "valley" => valley} unless dom(:elevation).empty?
      end

      def peak 
        @peak ||= dom(:elevation).search("ul li")[0].search(".white_pill").children.text.split.join unless dom(:elevation).empty?
      end

      def height_difference 
        @height ||= dom(:elevation).search("ul li")[1].search(".white_pill").children.text.split.join unless dom(:elevation).empty?
      end

      def valley
        @valley ||= dom(:elevation).search("ul li")[2].search(".white_pill").children.text.split.join unless dom(:elevation).empty?
      end

    end
  end
end

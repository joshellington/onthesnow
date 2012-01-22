module OnTheSnow
  module Resort
    module Lifts

      def lifts
        @lifts ||= {"total" => total_lifts, "trams" => trams_lifts, "fast_sixes" => fast_sixes_lifts, "fast_quads" => fast_quads_lifts, "quad" => quad_lifts, "triple" => triple_lifts, "double" => double_lifts, "surface" => surface_lifts} unless dom(:lifts).empty?
      end

      def total_lifts
        @total_lifts ||= dom(:lifts).search("ul .total strong").text.split.join unless dom(:lifts).empty?
      end

      def trams_lifts
        @trams_lifts ||= dom(:lifts).search("ul .trams strong").text.split.join unless dom(:lifts).empty?
      end

      def fast_sixes_lifts
        @fast_sixes_lifts ||= dom(:lifts).search("ul .fast_sixes strong").text.split.join unless dom(:lifts).empty?
      end

      def fast_quads_lifts
        @fast_quads_lifts ||= dom(:lifts).search("ul .fast_quads strong").text.split.join unless dom(:lifts).empty?
      end

      def quad_lifts
        @quad_lifts ||= dom(:lifts).search("ul .quad strong").text.split.join unless dom(:lifts).empty?
      end

      def triple_lifts
        @triple_lifts ||= dom(:lifts).search("ul .triple strong").text.split.join unless dom(:lifts).empty?
      end

      def double_lifts
        @double_lifts ||= dom(:lifts).search("ul .double strong").text.split.join unless dom(:lifts).empty?
      end

      def surface_lifts
        @surface_lifts ||= dom(:lifts).search("ul .surface strong").text.split.join unless dom(:lifts).empty?
      end

    end
  end
end

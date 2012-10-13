module OnTheSnow
  module Resort
    module Info

      def info
        @info ||= {"name" => name, "description" => description, "phone" => phone, "website" => website, "image" => image, "trail_map" => trail_map, "regions" => regions, "url" => url} unless dom(:info).empty? && dom(:regions).empty?
      end

      def name
        @name ||= dom(:info).text unless dom(:info).empty?
      end

      def description
        @description ||= dom(:description).css("p").last.text.gsub(/\n/, '').gsub(/\t/, '') unless dom(:description).empty?
      end

      def phone
        @phone ||= dom(:contact).search("p")[2].text.gsub('Phone: ', '')
      end

      def website
        @website ||= dom(:contact_wrap).search("p a")[0].text
      end

      def image
        @image ||= dom(:description).css("#resort_image img")[0][:src] unless dom(:description).css("#resort_image img").empty?
      end

      def trail_map
        # @trail_map ||= dom(:trail_map).css(".module").text
        @trail_map ||= dom(:trail_map).css(".module img.overview")[0][:src].gsub(/mid/, 'xlarge')
      end

      def regions
        @regions ||= dom(:regions).map{|e| e.text} unless dom(:regions).empty?
      end

      def url
        @url
      end

    end
  end
end

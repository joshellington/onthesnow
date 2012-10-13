module OnTheSnow
  module Resort
    module Info

      def info
        @info ||= {"name" => name, "description" => description, "phone" => phone, "image" => image, "regions" => regions, "url" => url} unless dom(:info).empty? && dom(:regions).empty?
      end

      def name
        @name ||= dom(:info).text unless dom(:info).empty?
      end

      def description
        @description ||= dom(:description).css("p")[1].text.gsub(/\n/, '').gsub(/\t/, '')
      end

      def phone
        @phone ||= dom(:contact).search("p")[2].text.gsub('Phone: ', '')
      end

      def image
        @image ||= dom(:description).css("#resort_image img")[0][:src]
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

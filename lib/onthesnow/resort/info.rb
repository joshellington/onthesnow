module OnTheSnow
  module Resort
    module Info

      def info
        @info ||= {"name" => name, "description" => description, "phone" => phone, "image" => image, "states" => states, "url" => url} unless dom(:info).empty? && dom(:states).empty?
      end

      def name
        @name ||= dom(:info).text unless dom(:info).empty?
      end

      def description
        @description ||= dom(:resort_description).search("p")[0].text
      end

      def phone
        @phone ||= dom(:contact).search("p")[2].text.gsub('Phone: ', '')
      end

      def image
        @description ||= dom(:resort_description).search("#resort_image img")[0][:src]
      end

      def states
        @states ||= dom(:states).map{|e| e.text} unless dom(:states).empty?
      end

      def url
        @url
      end

    end
  end
end

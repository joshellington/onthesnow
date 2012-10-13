module OnTheSnow
  module Resort
    module Info

      def infos
        @infos ||= {"name" => name, "description" => description, "image" => image, "states" => states, "url" => url} unless dom(:info).empty? && dom(:states).empty?
      end

      def name
        @name ||= dom(:info).text unless dom(:info).empty?
      end

      def description
        @description ||= dom(:description).css("p")[1].text.gsub(/\n/, '').gsub(/\t/, '')
      end

      def image
        @image ||= dom(:description).css("#resort_image img")[0][:src]
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

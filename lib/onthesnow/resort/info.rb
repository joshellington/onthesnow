module OnTheSnow
  module Resort
    module Info

      def infos
        @infos ||= {"name" => name, "description" => description, "states" => states, "url" => url} unless dom(:info).empty? && dom(:states).empty?
      end

      def name
        @name ||= dom(:info).text unless dom(:info).empty?
      end

      def description
        @description ||= dom(:resort_description).search("p")[0].text
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

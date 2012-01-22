module OnTheSnow
  module Resort
    module Info

      def infos
        @infos ||= {"name" => name, "states" => states, "url" => url} unless dom(:info).empty? && dom(:states).empty?
      end

      def name
        @name ||= dom(:info).text unless dom(:info).empty?
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

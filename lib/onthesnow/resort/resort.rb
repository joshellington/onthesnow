module OnTheSnow
  module Resort
    class Resort
      include OnTheSnow::Resort::Info
      include OnTheSnow::Resort::Lifts
      include OnTheSnow::Resort::Slopes
      include OnTheSnow::Resort::Elevation
      include OnTheSnow::Resort::Snow
      include OnTheSnow::Resort::Weather

      def initialize(url)
        @url    = url
        @api = OnTheSnow::API.instance
      end

      def to_hash
        @hash ||= {"info" => infos, "elevation" => elevation, "lifts" => lifts, "slopes" => slopes, "snow" => snow, "weather" => weather}
      end

      def self.all
        if @resorts
          @resorts
        else
          @resorts = {}
          @resorts_count = 0
          @api = OnTheSnow::API.instance
          @api.states.each_value do |state|
            @api.rss(state["rss"]).items.each do |item|
              url = @api.build_profile_url_from_snow_resort_url(item.guid)
              resort = new(url)
              @resorts[(@resorts_count+=1).to_s] = resort.to_hash 
              #warn "grab #{resort.infos["name"]} => #{resort.inspect}\n" 
            end
          end
          @resorts
        end
      end

      private
      def dom(name)
        css_selector = case name
        when :elevation
          "#resort_elevation"
        when :info
          ".resort_name"
        when :lifts
          "#resort_lifts"
        when :slopes
          "#resort_terrain"
        when :snow
          ".snow_report"
        when :weather
          ".forecast_content"
        when :states
          ".rel_regions a"
        else
          raise "Missing dom element"
        end

        @api.profile(url).search(css_selector)
      end

    end
  end
end

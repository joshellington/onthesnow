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
        # @cache = ActiveSupport::Cache::MemoryStore.new
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
        path ||= "profile"

        case name
        when :elevation
          css_selector = "#resort_elevation"
        when :info
          css_selector = ".resort_name"
        when :lifts
          css_selector = "#resort_lifts"
        when :slopes
          css_selector = "#resort_terrain"
        when :snow
          css_selector = ".snow_report"
        when :weather
          css_selector = ".forecast_content"
        when :regions
          css_selector = ".rel_regions a"
        when :description
          css_selector = "#resort_description"
        when :contact
          css_selector = ".contact_details"
        when :contact_wrap
          css_selector = ".contact_wrap"
        when :trail_map
          css_selector = ".trailMap"
          path = "trailmap"
        when :body
          css_selector = "*"
          path = "weather"
        else
          raise "Missing dom element"
        end

        final = url+'/'+path+'.html'
        @api.profile(final).search(css_selector)
      end

    end
  end
end

module OnTheSnow
  module State
    class State
      attr_reader :state_name, :region_name, :state_rss

      def initialize(state_name, region_name, state_rss)
        @state_name = state_name
        @region_name = region_name
        @state_rss = state_rss
        @api = OnTheSnow::API.instance
      end

      def self.all
        if @states
          @states
        else
        @states = {}
        @api = OnTheSnow::API.instance
        @api.sitemap.css('#site_map_rss').each{|element|
          cols = [".colA",".colB"]
          @states_count = 0
          cols.each do |col|
            region = element.css(col)
            states = region.css('p a')

            states.each do |state|
              region_name = @api.remove_chars(element.css("#{col} h3").children.to_s)
              state_name  = @api.remove_chars(state.children.to_s)
              state_rss   = "#{::OnTheSnow.config.url}#{state.attributes["href"].value}"
              state_instance  = new(state_name, region_name, state_rss)
              @states[(@states_count+=1).to_s] = state_instance.to_hash 
            end
          end
        }
        end
        @states
      end

      def to_hash
        {"name" => state_name, "region" => region_name, "rss" => state_rss}
      end

    end
  end
end

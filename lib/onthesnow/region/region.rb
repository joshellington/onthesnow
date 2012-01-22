module OnTheSnow
  module Region
    class Region
      attr_reader :name

      def initialize(name)
        @name    = name
      end

      def self.all
        if @regions
          @regions
        else
          @regions = {}
          @api = OnTheSnow::API.instance
          @api.sitemap.css('#site_map_rss .colA h3 ,#site_map_rss .colB h3').each_with_index{|element,index|
            region_name = @api.remove_chars(element.children.to_s)
            region = new(region_name)
            @regions["#{index+1}"] = region.to_hash
          }
          @regions
        end
      end

      def to_hash
        {"name" => name} 
      end

    end
  end
end

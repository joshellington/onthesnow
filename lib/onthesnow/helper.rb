module OnTheSnow
  module Helper

    def url
      @url ||= ::OnTheSnow.config.url
    end

    def site_map_rss_url
      @site_map_rss_url ||= ::OnTheSnow.config.site_map_rss_url
    end

    def sitemap
      @sitemap ||= Nokogiri::HTML(open(site_map_rss_url))
    end

    def rss_url(state)
      "#{url}/#{state}/snow.rss"
    end

    def rss(url)
      SimpleRSS.parse(open(url))
    end

    def profile(url)
      Nokogiri::HTML(open(url))
    end

    def build_profile_url_from_snow_resort_url(url)
      url.split("/")[0..-2].join("/").concat("/profile.html")
    end

    def remove_chars(element)
      element.gsub(/Ski Report.*$/,"").strip
    end

  end
end

require 'nokogiri'
require 'open-uri'
require 'simple-rss'

require "onthesnow/version"
require 'onthesnow/helper'
require 'onthesnow/api'
require 'onthesnow/region'
require 'onthesnow/state'
require 'onthesnow/resort'
require 'onthesnow/config'

module OnTheSnow
  def self.config(&block)
    if block_given?
      yield config
    else
      @__config ||= OnTheSnow::Config.new
    end
  end
end

OnTheSnow.config do |c|
  c.url "http://www.onthesnow.com"
  c.site_map_rss_url "http://www.onthesnow.com/site_map_rss.html"
end

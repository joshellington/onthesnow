# onthesnow 

This is a very small API to get informations from http://www.onthesnow.com
I need it in [another project](https://github.com/janowiesniak/snowcat-rhoconnect) to fill a redis store, that is why all api calls return hashes.

Install
--------

```shell
gem install onthesnow
```
or add the following line to Gemfile:

```ruby
gem 'onthesnow'
```
and run `bundle install` from your shell.

Usage
----------------

```ruby
api = OnTheSnow::API.instance

api.regions
 => {"1"=>{"name"=>"USA"}, "2"=>{"name"=>"Europe"}}

api.states
 => {"1"=>{"region"=>"USA", "name"=>"Alaska", "rss"=>"http://www.onthesnow.com/AK/snow.rss"}}

# this crawl over ALL resorts and could take really really long!
api.resorts
 => hash of all resorts

# probably you should use resort directly. Initialize it with the profile page.
resort = OnTheSnow::Resort::Resort.new("http://www.onthesnow.com/dolomiti-superski/plan-de-corones-kronplatz/profile.html")

resort.infos
 => {"name"=>"Plan de Corones / Kronplatz", "url"=>"http://www.onthesnow.com/dolomiti-superski/plan-de-corones-kronplatz/profile.html", "states"=>["All Italy", "Bolzano-Bozen", "Dolomiti Superski", "Italy", "S\303\274dtirol"]} 

resort.weather
 => {"condition"=>"Mostly Cloudy", "date"=>"Jan 22", "temperature"=>{"c"=>"1\302\260C", "f"=>"34\302\260F"}} 

resort.slopes
 => {"beginner"=>"80%", "advanced"=>"0%", "intermediate"=>"20%", "expert"=>"0%"} 

resort.elevation
 => {"peak"=>"8858Ft.", "valley"=>"3117Ft.", "height_difference"=>"3701Ft."} 

resort.lifts
 => {"quad"=>"1", "fast_quads"=>"", "trams"=>"22", "fast_sixes"=>"0", "surface"=>"5", "total"=>"0", "double"=>"0", "triple"=>"4"} 

resort.to_hash
 => {"weather"=>{"condition"=>"Mostly Cloudy", "date"=>"Jan 22", "temperature"=>{"c"=>"1\302\260C", "f"=>"34\302\260F"}}, "elevation"=>{"peak"=>"8858Ft.", "valley"=>"3117Ft.", "height_difference"=>"3701Ft."}, "lifts"=>{"quad"=>"1", "fast_quads"=>"", "trams"=>"22", "fast_sixes"=>"0", "surface"=>"5", "total"=>"0", "double"=>"0", "triple"=>"4"}, "snow"=>{"last_24"=>"0in.", "last_48"=>"0in.", "last_72"=>"0in."}, "info"=>{"name"=>"Plan de Corones / Kronplatz", "url"=>"http://www.onthesnow.com/dolomiti-superski/plan-de-corones-kronplatz/profile.html", "states"=>["All Italy", "Bolzano-Bozen", "Dolomiti Superski", "Italy", "S\303\274dtirol"]}, "slopes"=>{"beginner"=>"80%", "advanced"=>"0%", "intermediate"=>"20%", "expert"=>"0%"}}
```

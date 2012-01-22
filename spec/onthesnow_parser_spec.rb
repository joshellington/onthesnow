require File.join(File.dirname(__FILE__),'spec_helper')

describe "OnTheSnow" do
  describe "API" do
    it "should initialize a OnTheSnow::API" do
      api.should be_kind_of OnTheSnow::API
    end

    describe "private methods" do
      it "should return url" do
        api.send(:url).should == "http://www.onthesnow.com"
      end

      it "should return site map rss url" do
        api.send(:site_map_rss_url).should == "http://www.onthesnow.com/site_map_rss.html"
      end

      it "should return rss url" do
        api.send(:rss_url, "AK").should == "http://www.onthesnow.com/AK/snow.rss"
      end
    end

    describe "#regions" do
      it "should return a Hash of regions" do
        api.regions().should be_kind_of Hash
      end

      it "should contain USA and Europe" do
        api.regions["1"]["name"].should == "USA"
        api.regions["2"]["name"].should == "Europe"
      end
    end

    describe "#states" do
      it "should return a Hash of states" do
        api.states.should be_kind_of Hash
      end

      describe "first state" do
        it "should contain name Alaska" do
          api.states["1"]["name"].should == "Alaska"
        end

        it "should contain region USA" do
          api.states["1"]["region"].should == "USA"
        end

        it "should contrain rss url" do
          api.states["1"]["rss"].should == "http://www.onthesnow.com/AK/snow.rss"
        end
      end
    end

  describe "#resorts" do
    it "should return a Hash of resorts" do
      api.resorts.should be_kind_of Hash
    end
    
    describe "first resort" do
      it "should return a hash" do
        api.resorts["1"].to_hash.should be_kind_of Hash
      end

      it "should contain name Alyeska" do
        api.resorts["1"]["info"]["name"].should == "Alyeska"
      end

      it "should contain state Alaska" do
        api.resorts["1"]["info"]["states"].first.should == "Alaska"
      end

      it "should contain right profile url" do
        api.resorts["1"]["info"]["url"].should == "http://www.onthesnow.com/alaska/alyeska-resort/profile.html"
      end

      it "should contain peak height" do
        api.resorts["1"]["elevation"]["peak"].should == "2750Ft."
      end
      
      it "should contrain valley height" do
        api.resorts["1"]["elevation"]["valley"].should == "250Ft."
      end

      it "should contain height difference between peak and valley" do
        api.resorts["1"]["elevation"]["height_difference"].should == "2500Ft."
      end

      describe "lifts" do
        it "should contain 9 total lifts" do
          api.resorts["1"]["lifts"]["total"].should == "9"
        end

        it "should contain 1 tram lifts" do
          api.resorts["1"]["lifts"]["trams"].should == "1"
        end

        it "should contain 0 fast sixes lifts" do
          api.resorts["1"]["lifts"]["fast_sixes"].should == "0"
        end

        it "should contain 1 fast quads lifts" do
          api.resorts["1"]["lifts"]["fast_quads"].should == "1"
        end

        it "should contain 3 quad lifts" do
          api.resorts["1"]["lifts"]["quad"].should == "3"
        end

        it "should contain 0 triple lifts" do
          api.resorts["1"]["lifts"]["triple"].should == "0"
        end

        it "should contain 2 double lifts" do
          api.resorts["1"]["lifts"]["double"].should == "2"
        end

        it "should contain 2 surface lifts" do
          api.resorts["1"]["lifts"]["surface"].should == "2"
        end
      end

      describe "slopes" do
        it "should contain 10% beginner terrain" do
          api.resorts["1"]["slopes"]["beginner"].should == "10%"
        end

        it "should contain 30% intermediate terrain" do
          api.resorts["1"]["slopes"]["intermediate"].should == "30%"
        end

        it "should contain 20% advanced terrain" do
          api.resorts["1"]["slopes"]["advanced"].should == "20%"
        end

        it "should contain 40% expert terrain" do
          api.resorts["1"]["slopes"]["expert"].should == "40%"
        end
      end

      describe "snow" do
        it "should contain 1 in. in the last 24 hours" do
          api.resorts["1"]["snow"]["last_24"].should == "1in."
        end

        it "should contain 2 in. in the last 48 hours" do
          api.resorts["1"]["snow"]["last_48"].should == "2in."
        end

        it "should contain 3 in. in the last 72 hours" do
          api.resorts["1"]["snow"]["last_72"].should == "3in."
        end
      end

      describe "weather" do
        it "should contain Jan 21" do
          api.resorts["1"]["weather"]["date"].should == "Jan 21"
        end

        it "should contain temperature -17" do
          api.resorts["1"]["weather"]["temperature"]["f"].should match(/-17/)
        end

        it "should contain temperature -27" do
          api.resorts["1"]["weather"]["temperature"]["c"].should match(/-27/)
        end

        it "should contain clear" do
          api.resorts["1"]["weather"]["condition"].should == "Clear"
        end
      end
    end
  end
end

describe "Spec helper" do
  it "should return site_map_rss.html" do
    site_map_rss_html == File.read("spec/fixtures/site_map_rss.html")
  end

  it "should return alaska_snow_rss" do
    alaska_snow_rss == File.read("spec/fixtures/alaska_snow.rss")
  end

  it "should return alyska_profile_html" do
    alyska_profile_html == File.read("spec/fixtures/alyska_profile.html")
  end
end

  private
  def api
    api = OnTheSnow::API.instance
    FakeWeb.register_uri(:get, api.send(:site_map_rss_url), :body => site_map_rss_html)
    FakeWeb.register_uri(:get, %r|http:\/\/www.onthesnow.com\/[A-Z-]+\/snow.rss|, :body => alaska_snow_rss)
    FakeWeb.register_uri(:get, %r|http:\/\/www.onthesnow.com\/[a-z-]+\/[a-z-]+\/profile.html|, :body => alyska_profile_html)
    api
  end

  def site_map_rss_html
    File.read("spec/fixtures/site_map_rss.html")
  end

  def alaska_snow_rss
    File.read("spec/fixtures/alaska_snow.rss")
  end

  def alyska_profile_html
    File.read("spec/fixtures/alyska_profile.html")
  end
end

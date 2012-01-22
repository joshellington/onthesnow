module OnTheSnow
  class API
    include OnTheSnow::Helper
    private_class_method :new

    def self.instance
      @@instance ||= new
    end

    def regions
      OnTheSnow::Region::Region.all
    end

    def states
      OnTheSnow::State::State.all
    end

    def resorts
      OnTheSnow::Resort::Resort.all
    end
  end
end

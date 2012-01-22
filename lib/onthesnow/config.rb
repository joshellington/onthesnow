module OnTheSnow
  class Config
    def initialize(&block)
      @hash = {}
      if block_given?
        yield self
      end
    end

    def [](key)
      @hash[key]
    end

    def []=(key, value)
      @hash[key] = value
    end

    def method_missing(meth, *args, &blk)
      if block_given?
        self[meth] = self.class.new(&blk)
      else
        raise "only one argument supported" if args.size > 1

        return self[meth] if args.size == 0
        return self[meth] = args.first
      end
    end
  end
end

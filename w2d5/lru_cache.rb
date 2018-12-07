class LRUCache
    def initialize(cache_length)
        @cache = []
        @cache_length = cache_length
    end

    def count
      @cache.count
    end

    def add(el)
        if @cache.include?(el)
            @cache.delete(el)
            @cache << el 
        elsif self.count >= @cache_length 
            @cache.shift 
            @cache << el 
        else 
            @cache << el 
        end
    end

    def show
      p @cache
    end

    private
    # helper methods go here!

  end
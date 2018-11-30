class Map
    attr_accessor :map

    def initialize
        @map = []
    end

    def set(key, value)
        flagged = false
        map.each do |twople|
            if twople[0] == key 
                flagged = true 
            end 
        end 
        if flagged == false 
            map.push([key, value]) 
        end
    end

    def get(key)
       map.each do |twople|
        if twople[0] == key 
            return twople[1]
        end
        end
    end 

    def delete(key)
        map.each do |twople|
            if twople[0] == key 
                map - [[twople[0], twople[1]]] 
            end
        end
    end

end
# fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def clever_oct(fishes)
    longest = fishes[0]
    fish_arr.each do |fish|
        if fish.length > longest 
            longest = fish 
        end
    end
    longest
end



def sluggish_oct(fishes)
    fishes.each_with_index do |fish1, idx1|
        biggest = true

        fishes.each_with_index do |fish2, idx2|
            next if idx1 == idx2 
            biggest = false if fish2.length > fish1.length
        end

        return fish1 if biggest
    end
end

def n_log_n_merge_sort(fishes,&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return fishes if count <= 1

    mid = count / 2

    left = n_log_n_merge_sort(fishes[0...mid], &prc)
    right = n_log_n_merge_sort(fishes[mid..-1], &prc)

    n_log_n_merge(left, right, &prc)
end

def n_log_n_merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
        case prc.call(left, right)
        when -1 
            sorted << left.shift
        when 0 
            sorted << right.shift 
        when 1 
            sorted << right.shift 
        end
    end 
    sorted + left + right
end

def n_log_n_oct(fishes, &prc)
    prc = Proc.new { |x, y| y.length <=> x.length }
    n_log_n_merge_sort(fishes, &prc)
end

def slow_dance(direction, tile)
    tiles_array.each_with_index do |tile, idx|
        return idx if tile == direction 
    end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}


def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end



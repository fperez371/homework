class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1 
    @name2 = name2 
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13 
      4.times do 
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "wrong starting cup" if start_pos < 0 || start_pos > 12
    raise "starting cup is empty" @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    if cups[6].count > cups[13].count 
      name1 
    elsif cups[6].count < cups[13].count 
      name2 
    else 
      :draw
  end
end

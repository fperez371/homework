require 'queue'

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos) 
        @move_tree = build_move_tree
        @visited_positions = [pos]
    end

    def build_move_tree
        move = PolynewTreeNode.new([2,1])
        @root_node.add_child(move)
    end

    def new_move_positions(pos)
        new_moves = self.class.valid_moves(pos).reject do |possbile_pos| 
            visited_positions.include?(possbile_pos)
        end
        self.visited_positions += new_moves
    end
    ROWS = 3
    COLS = 2
    def self.valid_moves(pos)
        r, c = pos
        new_row = r + 2
        new_c = c + 1
        new_c, 
        new_row < ROWS
        new_c < COLS
    end


end
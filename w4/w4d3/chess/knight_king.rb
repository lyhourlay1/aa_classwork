module Stepable
  def moves
    possible_move = []
    self.move_diffs.each do |direction|
      x = @position[0] + direction[0]
      y = @position[1] + direction[1]
      possible_move << [x, y] if @board[x,y].color != self.color
    end
  end
end

class Knight < Piece
  include Stepable

  def initialize(color, board, position)
    super(color, board, position)
  end

  def symbol
    :N
  end

  private

  def move_diffs
    directions = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
end

class King < Piece
    include Stepable

    def initialize(color, board, position)
      super(color, board, position)
    end
    
    def symbol
        :K
    end

    private
    def move_diffs
        directions =[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]]
    end
end
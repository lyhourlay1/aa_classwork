module Slideable
  HORIZONTAL_DIRS = [[0,-1],[-1,0],[1,0],[0,1]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    #return array of all possibel moves you could 
    next_move = []
    self.move_dirs.each do |direction|
      next_move += self.grow_unblocked_moves_in_dir(direction[0],direction[1])
    end
    next_move
  end

  private

  # def move_dirs

  # end

  def grow_unblocked_moves_in_dir(dx, dy)
    #Should stop either before your own piece, or after taking opponents piece
    next_arr = []
    until @board[dx, dy].symbol != :N
      dx += @position[0]
      dy += @position[1]
      next_arr << [dx, dy]
    end
    if @board[dx, dy].color == self.color
      next_arr.pop
    end
    next_arr
  end
end

class Rook < Piece
  include Slideable


  def initialize(color, board, position)
    super(color, board, position)
  end
  
  def symbol
    :R
  end

  private
  
  def move_dirs
    #Rook moves in a straight vertical or horizontal direction
    #put all the possible moving indices 
    self.horizontal_dirs
  end

end

class Bishop < Piece
  include Slideable

  def initialize(color, board, position)
    super(color, board, position)
  end

  def symbol
    :B
  end

  private
  def move_dirs
    self.diagonal_dirs
  end
end

class Queen < Piece
  include Slideable

  def initialize(color, board, position)
    super(color, board, position)
  end

  def symbol
    :Q
  end

  private
  
  def move_dirs
    self.horizontal_dirs + self.diagonal_dirs
  end
end
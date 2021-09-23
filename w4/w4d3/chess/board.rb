require_relative 'piece'
require_relative 'knight_king'
require_relative 'null_piece'
require_relative 'pawn'
require_relative 'rook_bishop_queen'
require 'byebug'
class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = nil
        populate
    end

    def populate
      rooks= [[0,0],[0,7],[7,0],[7,7]]
      kings =[[0,3],[7,3]]
      queens=[[0,4],[7,4]]
      knights=[[0,1], [0,6], [7,1],[7,6]]
      bishops=[[0,2],[0,5],[7,2],[7,5]]

      @rows.each_with_index do |row, i|
        row.each_with_index do |square, j|
          position = [i, j]
          if i==1
            self[position]=(Pawn.new("Black", self, position))
          elsif i==6
            self[position]=(Pawn.new("White", self, position))
          elsif i>=2 && i<=5
            
            self[position] = NullPiece.instance
          elsif rooks.include?(position)
            if i == 0
              
              self[position]=(Rook.new("Black", self, position))
            else
              self[position]=(Rook.new("White", self, position))
            end
          elsif knights.include?(position)
            if i == 0
              self[position]=(Knight.new("Black", self, position))
            else
              self[position]=(Knight.new("White", self, position))
            end
          elsif bishops.include?(position)
            if i == 0
              self[position]=(Bishop.new("Black", self, position))
            else
              self[position]=(Bishop.new("White", self, position))
            end
          elsif kings.include?(position)
            if i == 0
              self[position]=(King.new("Black", self, position))
            else
              self[position]=(King.new("White", self, position))
            end
          elsif queens.include?(position)
            if i == 0
              self[position]=(Queen.new("Black", self, position))
            else
              self[position]=(Queen.new("White", self, position))
            end
          end
        end
      end
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @rows[pos[0]][pos[1]] = value
    end

    def move_piece(color, start_pos, end_pos)
      if !self[start_pos].is_a?(Piece) 
        raise "Invalid position"
      # elsif start_pos[0] < 0 || start_pos[0] > 7 || end_pos[0] < 0 || end_pos[0] > 7
      end
      moved_piece = @rows[start_pos[0]][start_pos[1]]
      self[end_pos] = moved_piece
      self[start_pos] = NullPiece.instance
    end

    # def valid_pos?(pos)
    #     # if !self[pos].is_a?(Piece)
    #     #     raise "Invalid position"
    #     #     en
    # end

    # def add_piece(piece, pos)

    # end

    # def checkmate?(color)

    # end

    # def in_check?(color)

    # end

    # def find_king(color)

    # end

    # def pieces

    # end

    # def dup

    # end

    # def move_piece!(color, start_pos, end_pos)

    # end
end
require_relative 'board'
require 'colorize'
class Display
    def initialize(board)
        @board=board

    end

    def render
      puts "  0 1 2 3 4 5 6 7 ".blue 
      @board.rows.each.with_index do |row,i|
        print_row=i.to_s.blue
        row.each_with_index do |square, j|
          position = [i,j]
          if @board.rows[i][j].color== 'Black'
            print_row << " "+ @board.rows[i][j].symbol.to_s.red
          elsif @board.rows[i][j].color== 'White'
            print_row << " "+ @board.rows[i][j].symbol.to_s.cyan
          else
            print_row << " "+ @board.rows[i][j].symbol.to_s
          end
        end
        puts print_row
      end
      return nil
    end
end

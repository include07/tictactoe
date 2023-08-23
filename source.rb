# frozen_string_literal: true

# Board class to represent state of board
class Board
  attr_accessor :board, :checked, :unchecked, :repeat, :p1, :p2

  def initialize
    @grid = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @checked = 0
    @unchecked = 9
    @repeat = true
    @p1 = nil
    @p2 = nil
  end

  # set player 1 and 2 symbols
  def setup
    puts 'Hello to the xo ruby programm, player1 choose your symbol
          (x or o) and press enter, player2 will automatically get the other one'
    if gets.chomp == 'x'
      self.p1 = 'x'
      self.p2 = 'o'
    else
      self.p1 = 'o'
      self.p2 = 'x'
    end
  end

  # output the grid
  def draw_grid
    0..2.each do |i|
      0..2.each do |j|
        puts "| #{grid[i][j]} | #{grid[i][j]} | #{grid[i][j]} |"
      end
    end
  end
end

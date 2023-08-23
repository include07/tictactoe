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
    @who_turn = 1
  end

  # set player 1 and 2 symbols
  def setup
    puts 'Hello to tictactoe-rb, player1 choose your symbol (x or o) and press enter, player2 will get the other one'
    if gets.chomp == 'x'
      self.p1 = 'x'
      self.p2 = 'o'
    else
      self.p1 = 'o'
      self.p2 = 'x'
    end
    puts 'Let the game begin!!'
  end

  # output the grid
  def draw_grid
    3.times do |i|
      puts "| #{@grid[i][0]} | #{@grid[i][1]} | #{@grid[i][2]} |"
    end
  end

  # check if someone won
  # rubocop:disable Metrics
  def winner?
    # Check rows, columns, and diagonals
    3.times do |i|
      return true if (@grid[i][0] == @grid[i][1] && @grid[i][1] == @grid[i][2]) || # Rows
                     (@grid[0][i] == @grid[1][i] && @grid[1][i] == @grid[2][i])    # Columns
    end
    # Check diagonals
    return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
    return true if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]

    false
  end

  # get player choice and output updated board
  def turn
    draw_grid
    choice = nil
    loop do
      puts "player#{@who_turn} it's your turn, choose a number (1-9)"
      choice = gets.chomp.to_i
      # Check if the entered number exists in the corresponding grid cell.
      unless (1..9).include?(choice) && @grid[(choice - 1) / 3][(choice - 1) % 3] == choice.to_s
        puts "Invalid choice. Please enter a number between 1 and 9 that hasn't been chosen yet."
        next
      end
      break
    end
    @grid[(choice - 1) / 3][(choice - 1) % 3] = @who_turn == 1 ? @p1 : @p2
    if winner?
      @repeat = false
      puts "Congrats player#{@who_turn} you have won!!"
    end
    @who_turn = @who_turn == 1 ? 2 : 1
  end
  # rubocop:enable Metrics
end

# start the game
board = Board.new
board.setup
board.turn while board.repeat

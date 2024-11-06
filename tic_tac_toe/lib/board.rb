# This is class that will create the game-boars for each game round
class Board
  attr_reader :board, :positions_selected
  attr_accessor :winner

  TEMPLATE = "1 | 2 | 3\n4 | 5 | 6\n7 | 8 | 9\n".freeze
  RESULTS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = Array.new(9, "-")
    @positions_selected = []
    @winner = nil
  end

  def print_board # rubocop:disable Metrics/AbcSize
    puts "#{board[0]} | #{board[1]} | #{board[2]}\n" \
         "#{board[3]} | #{board[4]} | #{board[5]}\n" \
         "#{board[6]} | #{board[7]} | #{board[8]}\n"
  end

  def self.template
    puts TEMPLATE
  end

  def self.results
    RESULTS
  end
end

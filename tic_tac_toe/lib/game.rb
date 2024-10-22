class Game 
  attr_reader :board, :postions_selected
  attr_accessor :round_winner

  @@number_rounds = 3
  @@symbols = ["X", "O"]
  @@players_list = []

  TEMPLATE = "1 | 2 | 3\n" + "4 | 5 | 6\n" + "7 | 8 | 9\n"
  RESULTS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = Array.new(9, "-")
    @positions_selected = []
    @round_winner = nil
  end

  def self.set_players_list(player1, player2)
    @@players_list = [player1, player2]
  end

  def self.get_players 
    puts "Player 1: #{@@players_list[0].name} Symbol: #{@@players_list[0].symbol}\n" +
         "Player 2: #{@@players_list[1].name} Symbol: #{@@players_list[1].symbol}"
  end


  def self.get_symbol 
    @@symbols.sample
  end
end

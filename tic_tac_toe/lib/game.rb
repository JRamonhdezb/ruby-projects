# This is class is the one who rule the game flow # rubocop:disable Layout/EndOfLine
# rubocop: disable Style Metrics
require_relative "lib/board"
require_relative "lib/player"
class Game
  attr_reader :board, :positions_selected, :symbols
  attr_accessor :round_winner


  def initialize
    @rounds_number = nil
    @rounds_winners = []
    @players_list << Player.list
  end

  def self.players
    @@players_list
  end

  def self.set_players_list(player1, player2)
    @@players_list = [player1, player2]
  end

  def self.number_rounds
    @@number_rounds
  end
end

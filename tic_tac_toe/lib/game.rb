# rubocop: disable Style Metrics
require_relative "board"
require_relative "player"
class Game
  attr_accessor :rounds_number, :rounds_winners


  def initialize
    @rounds_number = 1
    @rounds_winners = []
  end

  def round
    round = Board.new
    Player.list.shuffle!
    puts "Tic-Tac_Toe game"
    Board.template
    puts "Round Number #{rounds_number}"
    loop do
      Player.list.each do |player|
        break if round.positions_selected.length == 9
        break unless round.winner.nil?

        puts "#{player.name}, is your turn, choose a position for #{player.symbol}"
        position = player.choose_position
        while round.positions_selected.include? position
          puts "#{player.name}, that position is filled, please choose another one."
          position = player.choose_position
        end
        player.add_position(position)
        round.positions_selected << position
        round.board[position] = player.symbol
        round.print_board
        set = player.positions_choosen.sort
        round.winner = player.name if Board.results.any? { |arr| (set & arr) == arr }
      end
      break if round_over?(round) == true
      break if round_winner?(round) == true
    end
  end

  def round_over?(board)
    if board.positions_selected.length == 9 && board.winner == nil
      puts "End Game, there is no round winner"
      self.rounds_number += 1
      return true
    end
  end

  def round_winner?(board)
    unless board.winner.nil?
      puts "The round winner is #{board.winner}"
      self.rounds_winners << board.winner
      return true
    end
  end

  def next_round?
    loop do
      puts "Do you want to play another round: y / n"
      answer = gets.chomp
      if answer.downcase == "y"
        Player.clear_positions
        self.rounds_number += 1
        return true
      end
      return false if answer.downcase == "n"
    end
  end

  def start
    set_up
    loop do
      round
      break if next_round? != true
    end
    puts "The number of rounds played: #{rounds_number}"
    puts "The rounds winners:"
    # p rounds_winners
    p winners
  end

  def set_up
    Player.new
    Player.new
    Player.print_list
  end

  def winners
    rounds_winners.reduce(Hash.new(0)) do |result, player|
      result[player] += 1
      result
    end
  end
end

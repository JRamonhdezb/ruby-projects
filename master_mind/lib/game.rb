require_relative "human_player" # rubocop:disable Layout/EndOfLine
require_relative "computer_player"
class Game # rubocop:disable Style/Documentation
  attr_accessor :winner, :guesser, :coder
  attr_reader :rounds_number

  COLORS = %w[red blue yellow green white black].freeze

  def initialize
    @rounds_number = 12
    @winner = nil
    set_players
  end

  def start # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    round = 1
    puts "Welcome to Mastermind game!, coder set code to guess"
    coder.set_code
    puts "Secret code: #{coder.code}" if coder.is_a? HumanPlayer
    loop do
      break if round > rounds_number

      puts "Round number #{round}/#{rounds_number}"
      puts "Colors to choose: #{COLORS}" if guesser.is_a? HumanPlayer
      guesser.set_guess
      result = coder.check_code(guesser.guess)
      break if game_over?(result)

      guesser.review(coder.remark) if guesser.is_a? ComputerPlayer
      guesser.guess.clear
      round += 1
    end
    print_result
  end

  def game_over?(result)
    return false unless result == 4

    self.winner = guesser
  end

  def print_result
    if winner.nil?
      puts "Game over, coder wins the game"
    else
      puts "Congratulations, guesser wins the game."
    end
    puts "Code to guess: #{coder.code}"
  end

  def set_players # rubocop:disable Metrics/MethodLength
    puts "MASTERMIND GAME \nDo you want to be the coder or guesser?"
    option = nil
    loop do
      puts "Enter 0 => Guesser  |  Enter 1 => Coder"
      option = gets.chomp.to_i
      if option.is_a? Integer
        break if  (0..1).include?(option.to_i)
      else
        puts "Try again. Enter valid option"
      end
    end
    create_players(option)
  end

  def create_players(option)
    if option.zero?
      @coder = ComputerPlayer.new
      @guesser = HumanPlayer.new
    else
      @coder = HumanPlayer.new
      @guesser = ComputerPlayer.new
    end
  end
end

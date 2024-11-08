require_relative 'human_player'
require_relative 'computer_player'
class Game
attr_reader :rounds_number, :guesser, :coder
  def initialize
    @guesser = HumanPlayer.new
    @coder = ComputerPlayer.new
    @rounds_number = 12
  end

  def start
    winner = "Coder"
    round = 1
    puts "Welcome to the game"
    puts "Computer set code to guess"
    coder.set_code
    loop do 
      break if round > rounds_number
      puts "Round number #{round}/#{rounds_number}"
      guesser.set_guess
      guess = guesser.guess
      red_pin = coder.check_code(guess)
      p coder.code
      if red_pin == 4
        winner = "Guesser"
        break
      end
      guesser.guess.clear
      round += 1
    end
    puts winner
  end

end

new_game = Game.new
new_game.start
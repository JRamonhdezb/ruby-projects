require_relative 'human_player'
require_relative 'computer_player'
class Game
attr_reader :rounds_number, :guesser, :coder
attr_accessor :winner
COLORS =["red", "blue", "yellow", "green", "white", "black"]

  def initialize
    @guesser = HumanPlayer.new
    @coder = ComputerPlayer.new
    @rounds_number = 12
    @winner = nil
  end

  def start
    round = 1
    puts "Welcome to Mastermind game!, Computer set code to guess"
    coder.set_code
    loop do 
      break if round > rounds_number
      puts "Round number #{round}/#{rounds_number}"
      puts "Colors to choose: #{COLORS}"
      guesser.set_guess
      guess = guesser.guess
      result = coder.check_code(guess)
      break if game_over?(result)
      guesser.guess.clear
      round += 1
    end
    print_result
  end

  def game_over?(result)
      if result == 4
        self.winner = guesser
      end
  end

  def print_result
      if winner != nil
        puts "Congratulations, you win the game."
      else 
        puts "Sorry, game over you lose"  
      end  
      puts "Code to guess: #{coder.code}"
  end

end

new_game = Game.new
new_game.start
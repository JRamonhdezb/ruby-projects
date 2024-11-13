require_relative "lib/game" # rubocop:disable Layout/EndOfLine

def game_flow
  loop do
    new_game = Game.new
    new_game.start
    break if play_again? == false
  end
end

def play_again? # rubocop:disable Metrics/MethodLength
  loop do
    puts "Do you want to play again? Aswer y / n"
    answer = gets.chomp.strip
    if answer == "y"
      return true
    elsif answer == "n"
      return false
    else
      puts "Try again. Enter a valid input"
    end
  end
end

game_flow

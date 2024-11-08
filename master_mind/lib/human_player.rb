require_relative 'player'
class HumanPlayer < Player
  attr_accessor :guess

  def initialize
    @guess = []
  end

  def set_guess
    position = 1
    puts "Colors: #{Player::COLORS}"
    while guess.length < 4 
      puts "Please enter a color for your guess code in position ##{position}"
      color = get_valid_color
      next if is_twice?(color)
      self.guess << color
      puts "Guess code: #{guess}"
      position += 1
    end
    puts "Guess code selected: #{guess}"
  end

  def get_valid_color
    color = gets.chomp.downcase
    while COLORS.none? { |color_piece| color_piece == color}
      puts "Please enter a valid color. Valid colors: #{Player::COLORS} "
      color = gets.chomp.downcase
    end
    color
  end

  def is_twice? (color)
    if guess.count(color) >= 2
      puts "Can only enter the same color two times in guess code. Try again"
      return true
    end
  end
  
end


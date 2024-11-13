require_relative 'player'
class HumanPlayer < Player
  attr_accessor :guess, :code, :remark

  def initialize
    @guess = []
    @code = []
    @remark = Array.new(4)
  end

  def set_guess
    position = 1
    while guess.length < 4 
      puts "Please enter a color for your guess code in position ##{position}"
      color = get_valid_color
      next if is_twice?(color, guess)
      self.guess << color
      position += 1
    end
    puts "Guess code selected: #{guess}"
  end

  def get_valid_color
    color = gets.chomp.downcase.strip
    while COLORS.none? { |color_piece| color_piece == color}
      puts "Please enter a valid color. Valid colors: #{Player::COLORS} "
      color = gets.chomp.downcase.strip
    end
    color
  end

  def is_twice? (color, set)
    if set.count(color) >= 2
      puts "Can only enter the same color two times in array code. Try again"
      return true
    end
  end

  def set_code
    puts "Available colors to set sectret code: #{Player::COLORS}"
    while code.length < 4
      puts "Enter a color for your secret code"
      color = get_valid_color
      next if is_twice?(color, code)
      self.code << color
    end
  end

  def check_code(guess)
    puts "|| Secret Code: #{code} || \n|| Computer Guess: #{guess} ||"
    # puts "Enter number of white pins:"
    # # white_pin = enter_number
    puts "Enter number of red pins:"
    red_pins = enter_number
    while red_pins != correct_pins(guess)
      puts "Please be honest. Enter again red pins number"
      red_pins = enter_number      
    end
    red_pins
  end

  def enter_number
      number = gets.chomp.to_i
      number
  end

  def correct_pins(guess)
    correct_pins = 0
    guess.each_with_index do |color, index|
      if code[index] == color 
        correct_pins += 1 
        equal_pins(color, index)
      end
      
    end
    correct_pins
  end

  def equal_pins(color, index)
    self.remark[index] = color 
  end

end


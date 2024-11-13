require_relative "player" # rubocop:disable Layout/EndOfLine
class HumanPlayer < Player # rubocop:disable Style/Documentation
  attr_accessor :guess, :code, :remark

  def initialize # rubocop:disable Lint/MissingSuper
    @guess = []
    @code = []
    @remark = Array.new(4)
  end

  def set_guess
    position = 1
    while guess.length < 4
      puts "Please enter a color for your guess code in position ##{position}"
      color = get_valid_color
      next if twice?(color, guess)

      guess << color
      position += 1
    end
    puts "Guess code selected: #{guess}"
  end

  def get_valid_color # rubocop:disable Naming/AccessorMethodName
    color = gets.chomp.downcase.strip
    while COLORS.none? { |color_piece| color_piece == color }
      puts "Please enter a valid color. Valid colors: #{Player::COLORS} "
      color = gets.chomp.downcase.strip
    end
    color
  end

  def twice?(color, set)
    return false unless set.count(color) >= 2

    puts "Can only enter the same color two times in array code. Try again"
    true
  end

  def set_code
    puts "Available colors to set sectret code: #{Player::COLORS}"
    while code.length < 4
      puts "Enter a color for your secret code"
      color = get_valid_color
      next if twice?(color, code)

      code << color
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
    gets.chomp.to_i
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
    remark[index] = color
  end
end

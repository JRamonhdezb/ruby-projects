require_relative "player" # rubocop:disable Layout/EndOfLine
class ComputerPlayer < Player # rubocop:disable Style/Documentation
  attr_accessor :code, :guess, :final_guess

  def initialize # rubocop:disable Lint/MissingSuper
    @code = []
    @guess = []
    @final_guess = Array.new(4)
  end

  def set_code
    while code.length < 4
      color = COLORS.sample
      code << color if code.count(color) < 2
    end
  end

  def check_code(set)
    code = self.code.map { |color| color }
    red_pin = same_index(set, code)
    white_pin = in_other_index(set, code)
    clue = ["white_pin: #{white_pin}", "red_pin: #{red_pin}"]
    p clue
    red_pin
  end

  def same_index(set, code)
    red_pin = 0
    set.each_with_index do |color, index|
      next unless code.include?(color) && code[index] == (color)

      red_pin += 1
      code[index] = nil
      set[index] = nil
    end
    red_pin
  end

  def in_other_index(set, code)
    white_pin = 0
    set.each do |color|
      next if color.nil?

      next unless code.include? color

      white_pin += 1
      i = code.index color
      code[i] = "-"
    end
    white_pin
  end

  def set_guess # rubocop:disable Metrics/MethodLength
    self.guess = final_guess.map { |color| color }
    guess.each_with_index do |value, index|
      next unless value.nil?

      loop do
        color = COLORS.sample
        if guess.count(color) < 2
          guess[index] = color
          break
        end
      end
    end
  end

  def review(obs)
    obs.each_with_index do |color, index|
      next if color.nil?

      final_guess[index] = color
    end
  end
end

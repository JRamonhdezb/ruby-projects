require_relative 'player'
require 'pry-byebug'
class ComputerPlayer < Player
  attr_accessor :code 

  def initialize
    @code = []
  end

  def set_code
    while code.length < 4
      color = COLORS.sample
      code << color if code.count(color) < 2
    end
  end

  def check_code(set)
    code = self.code
    red_pin = same_index(set, code)
    white_pin = in_other_index(set, code)
    clue = ["white_pin: #{white_pin}", "red_pin: #{red_pin}"]
    p clue
  end

  def same_index(set, code)
    red_pin = 0
    set.each_with_index do |color, index|
      if code.include?(color)
        if code[index] == color
          red_pin += 1 
          code[index] = nil
          set[index] = nil
        end
      end
    end
    red_pin
  end

  def in_other_index(set, code)
    white_pin = 0
    set.each do |color|
      next if color == nil
      if code.include? color
        white_pin += 1
        i = code.index color
        code[i] = "-"
      end
    end 
    white_pin
  end
  
end

comp = ComputerPlayer.new
comp.set_code
p comp.code
# comp.code = ["yellow", "green", "green", "red"]
# p comp.code
code = ["blue", "black", "green", "white"]
p code
comp.check_code(code)
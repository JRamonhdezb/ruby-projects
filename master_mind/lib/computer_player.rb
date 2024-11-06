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

  def check_code(solution)
    white_pin = 0
    red_pin = 0
    solution.each_with_index do |color, index|
      if code.include?(color)
        white_pin += 1 if code.index(color) != index
        red_pin += 1 if code.index(color) == index
      end
    end
    clues = ["white_pin: #{white_pin}", "red_pin: #{red_pin}"]
    p solution 
    p clues
  end
  
end

comp = ComputerPlayer.new
comp.set_code
p comp.code
code = ["blue", "red", "black", "white"]
comp.check_code(code)
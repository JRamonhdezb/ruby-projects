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
  
end

comp = ComputerPlayer.new
comp.set_code
p comp.code
10.times do 
  comp.code.clear
  comp.set_code
  p comp.code
end
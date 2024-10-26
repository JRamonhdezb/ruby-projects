# rubocop: disable
class Player
  attr_accessor :name, :symbol, :positions_choosen

  def initialize(name)
    self.name = name
    @symbol = nil
    @positions_choosen = []
  end

  def choose_position
    # gets.chomp.to_i - 1
    position = gets.chomp
    numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9" ]
    until numbers.include? position
      puts "Plase, enter a valid number:"
      position = gets.chomp
    end
    position.to_i - 1
  end

  def add_position(number)
    positions_choosen << number
  end

  def clear_positions
    self.positions_choosen = []
  end
end

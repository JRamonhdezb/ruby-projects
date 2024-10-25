class Player
  attr_accessor :name, :symbol, :positions_choosen

  def initialize(name)
    self.name = name
    @symbol = nil
    @positions_choosen = []
  end

  def choose_position
    gets.chomp.to_i - 1
  end

  def add_position(number)
    positions_choosen << number
  end

  def clear_positions
    self.positions_choosen = []
  end
end

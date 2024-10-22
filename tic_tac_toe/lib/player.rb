
class Player
  attr_accessor :name, :symbol, :positions_choosen

  def initialize(name)
    self.name = name
    @symbol = nil 
    @positions_choosen = []
  end


end


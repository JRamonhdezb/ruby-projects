class Player
  attr_accessor :name, :symbol, :positions_choosen

  def initiliaze(name)
    @name = name
    @symbol = nil 
    @positions_choosen = []
  end
end
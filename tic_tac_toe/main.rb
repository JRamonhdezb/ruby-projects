require_relative "lib/game"
require_relative "lib/player"

# Section of code responsible for creating and setting up the two player objects.
puts "Enter Player_1 name:"
player1  = Player.new(gets.chomp)
player1.symbol = Game.get_symbol
puts "Enter Player_2 name:"
player2 = Player.new(gets.chomp)
player2.symbol = Game.get_symbol
while player1.symbol == player2.symbol
  player2.symbol = Game.get_symbol
end
Game.set_players_list(player1, player2)
Game.get_players


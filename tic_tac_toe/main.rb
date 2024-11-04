require_relative "lib/game"
# require 'pry-byebug'
# Section of code responsible for creating and setting up the two player objects.
player1 = Player.new
player2 = Player.new
Player.print_list

# Code section for only one round game
round = 1
next_round = true
while round <= Game.number_rounds && next_round
  game = Game.new
  Game.players.shuffle!
  puts "Tic-Tac_Toe game"
  Game.print_template
  puts "Round Number #{round}"

  loop do
    Game.players.each do |player|
      break if game.positions_selected.length == 9
      break unless game.round_winner.nil?

      puts "#{player.name}, is your turn, choose a position for #{player.symbol}"
      position = player.choose_position
      while game.positions_selected.include? position
        puts "#{player.name}, that position is filled, please choose another one."
        position = player.choose_position
      end
      player.add_position(position)
      game.positions_selected << position
      game.board[position] = player.symbol
      puts game.print_board
      set = player.positions_choosen.sort
      game.round_winner = player.name if Game.results.any? { |arr| (set & arr) == arr }
    end

    if game.positions_selected.length == 9
      puts "End Game, there is no round winner"
      break
    end
    unless game.round_winner.nil?
      puts "The round winner is #{game.round_winner}"
      break
    end
  end
  break if round == 3

  loop do
    puts "Do you want to play another round: y / n"
    answer = gets.chomp
    if answer.downcase == "y"
      player1.clear_positions
      player2.clear_positions
      round += 1
      break
    end
    if answer.downcase == "n"
      next_round = false
      break
    end
  end
end

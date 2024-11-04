# rubocop: disable
class Player
  attr_accessor :name, :symbol, :positions_choosen

  SYMBOLS = %w[X O].freeze
  @@list = [] # rubocop:disable Style/ClassVars

  def initialize
    @@list << self
    self.name = fill_name
    self.symbol = random_symbol
    self.positions_choosen = []
  end

  def choose_position
    position = gets.chomp
    numbers = %w[1 2 3 4 5 6 7 8 9]
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

  def fill_name
    puts "Please enter a player number: "
    gets.chomp
  end

  def random_symbol
    symbol = SYMBOLS.sample
    if Player.list.length > 1
      Player.list.each do |player|
        symbol = SYMBOLS.sample while (player.symbol == symbol) && (player != self)
      end
    end
    symbol
  end

  def self.list
    @@list
  end

  def self.print_list
    puts "Player 1: #{Player.list[0].name} Symbol: #{Player.list[0].symbol}\n" \
         "Player 2: #{Player.list[1].name} Symbol: #{Player.list[1].symbol}"
  end
end

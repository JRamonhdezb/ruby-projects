require_relative 'player'
require 'yaml'

class Game
  attr_accessor :secret_word, :secret_code, :tries, :player

  def initialize(word = nil, code = nil,  number = nil, player = nil)
    @secret_word = (word or pick_random_word)
    @secret_code = (code or generate_code)
    @tries = (number or 8)
    @player = (player or Player.new)
    self.start
  end

  def pick_random_word
    random_word = nil
    dictionary = File.readlines('google-10000-english-no-swears.txt')
    loop do 
      random_word = dictionary.sample.chomp
      break if (random_word.length >= 5 && random_word.length <= 12)
    end
    random_word
  end

  def generate_code
    size = secret_word.length
    Array.new(size, "_")
  end

  def check_guess(letter)
    word = secret_word.chars
    if word.any? {|l| l == letter} == true
      word.each_with_index do |char, index|
        if char == letter
          self.secret_code[index] = char
          self.player.guessed_letters << char
        end
      end
      self.player.guessed_letters.uniq!
      puts "how lucky you are!!"
    else
      self.player.wrong_guesses << letter 
      self.tries -= 1
      puts "Wrong letter!!"
    end
  end

  def game_over?
    if self.tries == 0
      puts "No more attempts. Better luck next time.\nGAME OVER"
      puts "The word to guess was #{secret_word}"
      return true
    else
      return false
    end
  end

  def game_won?
    if secret_code.join == secret_word
      puts "Congratulations, you guess the word. The answer is #{secret_word}"
      return true
    else
      return false
    end
  end

  def print_info
    puts " Word to guess: #{secret_code.join(" ")}\n" +
         " Correct guesses: #{player.guessed_letters.join(", ")}\n" +
         " Wrong guesses: #{player.wrong_guesses.join(", ")}\n" +
         " Number of tries: #{self.tries}"
  end

  def print_intro
    intro = File.read('intro.txt')
    puts intro
  end

  def start
    load_game if File.size?('output/saved_game.yaml') 
    self.print_intro
    loop do 
      print_info
      char = player.give_guess
      check_guess(char)
      exit if game_over? == true
      exit if game_won? == true
      exit if save? == true
    end
  end

  def save?
    puts "Do you want to save the game and finish it?"
    if player.get_answer == "y"
      Dir.mkdir('output') unless Dir.exist?('output')

      filename = "output/saved_game.yaml"
      File.open(filename, 'w') do |file|
       file.puts self.to_yaml
      end
      puts print_info
      return true
    end
  end

  def load_game
    puts "Do you want to load a saved game?"
    if player.get_answer == "y"
      string = File.read("output/saved_game.yaml")
      File.open('output/saved_game.yaml', 'w') {|file| file.truncate(0) }
      from_yaml(string)
    end
  end

  def to_yaml
    YAML.dump ({
      :secret_word => @secret_word,
      :secret_code => @secret_code,
      :tries => @tries,
      :player => @player
    })
  end

  def from_yaml(string)
    data = YAML.load(
      string,
      permitted_classes: [Player, Symbol]
    )
    # p data
    # p data[:player]
    Game.new(data[:secret_word], data[:secret_code], data[:tries], data[:player])
  end

end

Game.new
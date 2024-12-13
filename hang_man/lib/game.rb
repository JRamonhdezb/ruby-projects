require_relative 'player'

class Game
  attr_accessor :secret_word, :secret_code, :tries, :player

  def initialize
    @secret_word = pick_random_word
    @secret_code = generate_code
    @tries = 8
    @player = Player.new
  end

  def pick_random_word
    random_word = nil
    dictionary = File.readlines('google-10000-english-no-swears.txt')
    loop do 
      random_word = dictionary.sample.chomp
      break if (random_word.length >= 5 && random_word.length <= 12)
    end
    return random_word
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
    else
      self.player.wrong_guesses << letter 
      self.tries -= 1
    end
  end

  def game_over?
    if self.tries == 0
      puts "No more attempts. Better luck next time.\nGAME OVER"
      return true
    else
      return false
    end
  end

  def print_info
    puts "Word to guess: #{secret_code.join(" ")}" +
         "Correct guesses: #{player.guessed_letters.join(", ")}" +
         "Wrong guesses: #{player.wrong_guesses.join(", ")}" +
         "Number of tries: #{self.tries}"
  end


end


require_relative 'player'

class Game
  attr_accessor :secret_word, :secret_code, :tries, :player

  def initialize
    @secret_word = pick_random_word
    @secret_code = generate_code
    @tries = 8
    @player = Player.new
    # self.start
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
    self.print_intro
    loop do 
      print_info
      char = player.give_guess
      check_guess(char)
      break if game_over? == true
      break if game_won? == true
    end
  end

end

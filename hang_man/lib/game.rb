class Game
  attr_accessor :secret_word, :secret_code, :tries

  def initialize
    @secret_word = pick_random_word
    @secret_code = generate_code
    @tries = 8
  end

  def pick_random_word
    random_word = nil
    dictionary = File.readlines('google-10000-english-no-swears.txt')
    loop do 
      random_word = dictionary.sample
      break if (random_word.length >= 5 && random_word.length <= 12)
    end
    return random_word
  end

  def generate_code
    size = secret_word.length
    Array.new(size, "_")
  end

end


puts File.exist? "google-10000-english-no-swears.txt"
game = Game.new
puts game.secret_word
puts game.secret_word.length
puts "Word to guess: #{game.secret_code.join(" ")} "
puts game.tries
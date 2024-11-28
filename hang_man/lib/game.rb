class Game
  attr_accessor :secret_word

  def initialize
    @secret_word = pick_random_word
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

end


puts File.exist? "google-10000-english-no-swears.txt"
game = Game.new
puts game.secret_word
puts game.secret_word.length
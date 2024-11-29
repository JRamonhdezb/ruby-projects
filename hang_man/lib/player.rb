class Player
  attr_accessor :guessed_letters, :wrong_guesses
  
  Alphabet = %{abcdefghijklmnopqrstuvwxyz}

  def initialize
    @guessed_letters = []
    @wrong_guesses = []
  end
  
  def give_guess 
    puts "Please choose a letter that you think is part of the word to guess"
    letter = nil
    loop do 
      letter = gets.chomp.downcase
      break if check_guess(letter) == true
    end
    letter
  end

  def check_guess(letter)
    if Alphabet.include? letter
      if self.guessed_letters.none? {|l| l == letter} && self.wrong_guesses.none? {|l| l == letter}
        return true
      else
        puts "Please use a letter that has no be used in previous tries"
        return false 
      end
    else 
      puts "Please use a give a valid letter"
      return false
    end
  end

end


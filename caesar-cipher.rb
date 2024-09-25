# Ceasar Cipher project Ruby Basics

# Define method
def caesar_cipher(string, key)
    alpha = "abcdefghijklmnopqrstuvwxyz".split("").reverse
    # Convert string value to an array to iterate in it
    string_array = string.split("")
    # Iterate with each_with_index method in string_array
    string_array.each_with_index do |current_letter, index_letter|
        alpha_index = 0
        next if alpha.none? { |letter| letter == current_letter.downcase }
        # Loop in alpha array to find the index position of current letter in alphabet
        alpha.each_with_index do |letter, index|
            # Find the current letter index in alpha, and assign it in index_alphabet variable
            if letter == current_letter.downcase
                alpha_index = index
                break
            end
        end
        if current_letter == current_letter.upcase 
            string_array[index_letter] = alpha[alpha_index - key].upcase
        elsif
            string_array[index_letter] = alpha[alpha_index - key]
        end        
    end
    p string_array.join
end

caesar_cipher("What a string!", 5)
require 'pry-byebug'
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def count_em(str, substr)
    str.scan(/(?=#{substr})/).count
  end

def substrings(string, collection)
    string = string.downcase
    new_string = ""
    new_collection = []
    collection.each do |current_item|
        n = count_em(string, current_item)
        if string[current_item] 
           n.times {new_collection.push(current_item)} 
        end
    end
    new_collection = new_collection.reduce(Hash.new(0)) do |result, word|
        result[word] += 1
        result
      end
    p new_collection

    
end

substrings("Howdy partner, sit down! How's it going?", dictionary)


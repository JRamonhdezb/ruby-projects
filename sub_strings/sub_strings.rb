require "pry-byebug"
dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def count_em(str, substr)
  str.scan(/(?=#{substr})/).count
end

def substrings(string, collection)
  string = string.downcase
  new_collection = []
  collection.each do |current_item|
    n = count_em(string, current_item)
    n.times { new_collection.push(current_item) } if string[current_item]
  end
  new_collection = new_collection.each_with_object(Hash.new(0)) do |word, result|
    result[word] += 1
  end
  p new_collection
end

substrings("Howdy partner, sit down! How's it going?", dictionary)

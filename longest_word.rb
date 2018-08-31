require 'open-uri'
require 'json'

def generate_grid
  @letters = Array.new(5) { %w(A E I O U).sample }
  @letters += Array.new(5) { (('A'..'Z').to_a - %w(A E I O U )).sample }
  @letters.shuffle!
end

def included?(answer, grid)
  answer.chars do |letter|
    if grid.include? letter.upcase
      return true
    else
      return false
    end
  end
end


def english_word?(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
end

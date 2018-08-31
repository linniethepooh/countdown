require 'open-uri'
require 'json'

def generate_grid
  @letters = Array.new(5) { %w(A E I O U).sample }
  @letters += Array.new(5) { (('A'..'Z').to_a - %w(A E I O U )).sample }
  @letters.shuffle!
end

def included?(answer, grid)
  answer.chars do |letter|
    if grid.include? letter
      return true
    else
      return false
    end
  end
end



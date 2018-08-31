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

def english_word?(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
end

def compute_score(answer, time_taken)
  time_taken > 60.0 ? 0 : answer.size
end

def play_game(answer, grid, start_time, end_time)
  result = { time: end_time - start_time }

  score_and_message = score_and_message(answer, grid, result[:time])
  result[:score] = score_and_message.first
  result[:message] = score_and_message.last

  result
end

def score_and_message(answer, grid, time)
  if included?(answer.upcase, grid)
    if english_word?(answer)
      score = compute_score(answer, time)
      [score, "Well done!"]
    else
      [0, "#{answer} is not an english word."]
    end
  else
    [0, "Can't be built out of letter on the grid."]
  end
end

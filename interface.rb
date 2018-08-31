require_relative "longest_word"

puts "*************** Let's play Countdown! ***************"
puts "Here are your letters:"
grid = generate_grid
puts grid.join(" ")
puts "*****************************************************"

puts "What's the longest word you can find?"

start_time = Time.now
answer = gets.chomp
end_time = Time.now

result = play_game(answer, grid, start_time, end_time)

puts "Your word: #{answer}"
puts "Time Taken to answer: #{result[:time]}"
puts "Message: #{result[:message]}"

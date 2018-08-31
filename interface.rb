require_relative "longest_word"

puts "*************** Let's play Countdown! ***************"
puts "Here are your letters:"
grid = generate_grid
puts grid.join(" ")
puts "*****************************************************"

puts "What's the longest word you can find?"

answer = gets.chomp

puts included?(answer, grid)

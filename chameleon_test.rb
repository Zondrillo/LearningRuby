require_relative "chameleon.rb"

chameleon = Chameleon.new

while true
  puts "Choose your colour:"
  user_input = STDIN.gets.chomp
  chameleon.change_colour(user_input)
end

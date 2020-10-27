def stars(number)
  result = "*" * number
  return result
end

puts "Сколько вам звёзд на погоны?"
user_input = STDIN.gets.to_i
puts "Вот ваши звёзды :)"
puts stars(user_input)

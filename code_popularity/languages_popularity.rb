require 'json'

file = File.read('languages.json', encoding: 'UTF-8')
languages = JSON.parse(file)

sorted = languages.sort_by { |_key, value| -value }.to_h

max_value = sorted.values.max

puts "Самый популярный язык программирования: #{sorted.key(max_value)} - #{max_value}%"
puts

i = 1
sorted.each_pair do |key, value|
  puts "#{i}: #{key} - #{value}%"
  i += 1
end

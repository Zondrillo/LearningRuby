origin = [1, 2, 3, 4, 5, 6, 7]
reversed = []

for item in origin do
  reversed.unshift(item)
end

puts "Исходный массив:"
puts origin.to_s
puts "Новый массив, полученный из исходного:"
puts reversed.to_s

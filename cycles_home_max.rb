puts "Какой длины будет массив случайных чисел?"
input = gets.to_i

array = Array.new(input) { |element| rand(101) }

puts array.to_s

puts "Самое большое число: " + array.max.to_s

puts "Введите N"
input = gets.to_i

array = (1..input).to_a

puts "Массив " + array.to_s

puts "Сумма элементов массива = " + array.sum.to_s

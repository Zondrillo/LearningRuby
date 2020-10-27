puts "Введите число 1:"
number1 = gets.chomp.to_i
puts "Введите число 2:"
number2 = gets.chomp.to_i
puts "Введите число 3:"
number3 = gets.chomp.to_i

average = (number1 + number2 + number3) / 3

puts 'Первое число:' + number1.to_s
puts 'Второе число:' + number2.to_s
puts 'Третье число:' + number3.to_s
puts "Среднее арифметическое: " + average.to_s

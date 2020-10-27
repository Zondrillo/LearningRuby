puts 'Введите первое число:'
a = $stdin.gets.to_f
puts 'Введите второе число:'
b = $stdin.gets.to_f
puts 'Выберите операцию (+ - * /):'
operation = $stdin.gets.chomp

case operation
when '+'
  puts "Результат:\n#{a + b}"
when '-'
  puts "Результат:\n#{a - b}"
when '*'
  puts "Результат:\n#{a * b}"
when '/'
  puts "Результат:\n#{a / b}"
else
  puts "Неизвестная операция: #{operation}"
end

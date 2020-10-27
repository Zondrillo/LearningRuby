puts 'Введите первое число:'
a = $stdin.gets.to_i
puts 'Введите второе число:'
b = $stdin.gets.to_i
puts 'Выберите операцию (+ - * /):'
operation = $stdin.gets.chomp

begin
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
rescue ZeroDivisionError
  puts 'Деление на ноль'
end

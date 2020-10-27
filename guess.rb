number = rand(16)
try = 0

puts "Загадано число от 0 до 15, отгадайте какое?"

while try < 3 do
  input = gets.chomp.to_i
  if try == 2 && input != number
    puts "Не угадал, число было: " + number.to_s
    exit
  end
  if input == number
    puts "Ура, вы выиграли!"
    exit
  elsif (number - input).abs <= 2 && input < number
    puts "Тепло (нужно больше)"
  elsif (number - input).abs <= 2 && input > number
    puts "Тепло (нужно меньше)"
  elsif (number - input).abs > 2 && input < number
    puts "Холодно (нужно больше)"
  elsif (number - input).abs > 2 && input > number
    puts "Холодно (нужно меньше)"
  end
  try += 1
end

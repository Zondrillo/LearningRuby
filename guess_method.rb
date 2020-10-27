def check_number(guess, number)
  input = STDIN.gets.to_i
  if guess == 3 && input != number
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
end

num = rand(16)
puts "Загадано число от 0 до 15, отгадайте какое?"
try = 1
while try <= 3 do
  check_number(try, num)
  try += 1
end

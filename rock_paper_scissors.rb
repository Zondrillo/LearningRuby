options = ["Камень", "Ножницы", "Бумага"]

puts "Введите вариант: 0 - Камень, 1 - Ножницы, 2 - Бумага"
player_choice = gets.to_i
co_op_choice = rand(3)

puts "Вы выбрали: " + options[player_choice].to_s
puts "Компьютер выбрал: " + options[co_op_choice].to_s

if player_choice == 0 && co_op_choice == 1 ||
   player_choice == 1 && co_op_choice == 2 ||
   player_choice == 2 && co_op_choice == 0
  puts "Вы победили!"
elsif player_choice == co_op_choice
  puts "Ничья!"
else
  puts "Победил Компьютер."
end

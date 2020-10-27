require "./methods.rb"

clear_screen

puts "Игра \"Виселица\" версия 1"

letters = get_letters

errors = 0

wrong_letters = []
right_letters = []

while errors < 7 do
  print_status(letters, right_letters, wrong_letters, errors)
  puts "Введите следующую букву"
  user_input = get_user_input
  result = check_result(user_input, letters, right_letters, wrong_letters)
  if result == -1
    errors += 1
  elsif result == 1
    break
  end
end

print_status(letters, right_letters, wrong_letters, errors)

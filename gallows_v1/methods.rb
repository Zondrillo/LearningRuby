if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def get_letters
  slovo = ARGV[0]
  if slovo == nil || slovo == ""
    abort "Вы не ввели слово для игры."
  end
  return slovo.split("")
end

def get_user_input
  letter = ""
  while letter == ""
    letter = STDIN.gets.encode('UTF-8').chomp
  end
  return letter
end

def check_win(letters, right_letters)
  # Условие, когда отгадано всё слово
  if (letters - right_letters).empty?
      return 1
    else
      return 0
  end
end

def check_result(user_input, letters, right_letters, wrong_letters)
  if right_letters.include?(user_input) || wrong_letters.include?(user_input)
    return check_win(letters, right_letters)
  elsif (user_input == "е" || user_input == "ё") && (letters.include?("е") || letters.include?("ё"))
    right_letters.push("е", "ё")
    return check_win(letters, right_letters)
  elsif (user_input == "и" || user_input == "й") && (letters.include?("и") || letters.include?("й"))
    right_letters.push("и", "й")
    return check_win(letters, right_letters)
  elsif letters.include?(user_input)
    right_letters << user_input
    return check_win(letters, right_letters)
  else
    wrong_letters << user_input
    return -1
  end
end

def get_word_for_print(letters, right_letters)
  result = ""
  for letter in letters do
    if right_letters.include?(letter)
      result += letter + " "
    else
      result += "__ "
    end
  end
  return result
end

def print_status(letters, right_letters, wrong_letters, errors)
  puts "\nСлово: " + get_word_for_print(letters, right_letters)
  puts "Ошибки (#{errors}): #{wrong_letters.join(", ")}"
  if errors >= 7
    puts "Вы проиграли :("
  elsif (letters - right_letters).empty?
    puts "Поздравляем! Вы выиграли!\n\n"
  else
    puts "У Вас осталось попыток: " + (7 - errors).to_s
  end
end

def clear_screen
  system "clear" or system "cls"
end

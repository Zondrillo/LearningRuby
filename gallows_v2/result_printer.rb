class ResultPrinter

	def print_status(game)
		clear_screen
	  puts "\nСлово: " + get_word_for_print(game.letters, game.right_letters)
	  puts "Ошибки (#{game.errors}): #{game.wrong_letters.join(", ")}"
	  print_gallows(game.errors)
	  if game.errors >= 7
	    puts "Вы проиграли :("
	  elsif (game.letters - game.right_letters).empty?
	    puts "Поздравляем! Вы выиграли!\n\n"
	  else
	    puts "У Вас осталось попыток: " + (7 - game.errors).to_s
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

	def clear_screen
	  system("clear") || system("cls")
	end

	def print_gallows(errors)
		case errors
	  when 0
	    puts "
	          _______
	          |/
	          |
	          |
	          |
	          |
	          |
	          |
	          |
	        __|________
	        |         |
	        "
	    when 1
	      puts "
	          _______
	          |/
	          |     ( )
	          |
	          |
	          |
	          |
	          |
	          |
	        __|________
	        |         |
	        "
	    when 2
	      puts "
	          _______
	          |/
	          |     ( )
	          |      |
	          |
	          |
	          |
	          |
	          |
	        __|________
	        |         |
	        "
	    when 3
	      puts "
	          _______
	          |/
	          |     ( )
	          |      |_
	          |        \\
	          |
	          |
	          |
	          |
	        __|________
	        |         |
	        "
	    when 4
	      puts "
	          _______
	          |/
	          |     ( )
	          |     _|_
	          |    /   \\
	          |
	          |
	          |
	          |
	        __|________
	        |         |
	        "
	    when 5
	      puts "
	          _______
	          |/
	          |     ( )
	          |     _|_
	          |    / | \\
	          |      |
	          |
	          |
	          |
	        __|________
	        |         |
	        "

	    when 6
	      puts "
	          _______
	          |/
	          |     ( )
	          |     _|_
	          |    / | \\
	          |      |
	          |     / \\
	          |    /   \\
	          |
	        __|________
	        |         |
	        "
	    when 7
	      puts "
	          _______
	          |/     |
	          |     (_)
	          |     _|_
	          |    / | \\
	          |      |
	          |     / \\
	          |    /   \\
	          |
	        __|________
	        |         |
	        "
	  end
	end

end
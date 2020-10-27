class ResultPrinter

  def initialize
    @status_image = []
    current_path = File.dirname(__FILE__)
    counter = 0
    while counter <= 7 do
      file_name = "#{current_path}/image/#{counter}.txt"
      begin
        file = File.new(file_name, 'r:UTF-8')
        @status_image << file.read
        file.close
      rescue Errno::ENOENT
        @status_image << "\n[ Image #{file_name} not found ]\n"
      end
      counter += 1
    end
  end

  def print_status(game)
    clear_screen
    puts "\nСлово: #{get_word_for_print(game.letters, game.right_letters)}"
    puts "Ошибки (#{game.errors}): #{game.wrong_letters.join(', ')}"
    print_gallows(game.errors)
    if game.errors >= 7
      puts 'Вы проиграли :('
      puts "А слово было: #{game.show_word}"
    elsif (game.letters - game.right_letters).empty?
      puts "Поздравляем! Вы выиграли!\n\n"
    else
      puts "У Вас осталось попыток: #{7 - game.errors}"
    end
  end

  def get_word_for_print(letters, right_letters)
    result = ''
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
    system('clear') || system('cls')
  end

  def print_gallows(errors)
    puts @status_image[errors]
  end

end

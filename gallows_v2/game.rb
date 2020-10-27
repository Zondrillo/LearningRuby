class Game

	def initialize(word)
		@letters = get_letters(word)
		@errors = 0
		@right_letters = []
		@wrong_letters = []
		@status = 0
	end

	def get_letters(word)
		if word == nil || word == ""
    	abort "Вы не ввели слово для игры."
  	end
  	return word.split("")
	end

	def ask_next_letter
		puts "\nВведите следующую букву"
		letter = ""
		while letter == "" do
			letter = STDIN.gets.encode("UTF-8").chomp
		end
		next_step(letter)
	end

	def check_win
	  # Условие, когда отгадано всё слово
	  if (@letters - @right_letters).empty?
	      @status = 1
	  end
	end

	def next_step(bukva)
		if @status == -1 || @status == 1
			return
		elsif @right_letters.include?(bukva) || @right_letters.include?(bukva)
			return
		elsif (bukva == "е" || bukva == "ё") && (@letters.include?("е") || @letters.include?("ё"))
    	@right_letters.push("е", "ё")
    	check_win
	  elsif (bukva == "и" || bukva == "й") && (@letters.include?("и") || @letters.include?("й"))
	    @right_letters.push("и", "й")
	    check_win
		elsif @letters.include?(bukva)
			@right_letters << bukva
			check_win
		else
			@wrong_letters << bukva
			@errors += 1
			if @errors >= 7
				@status = -1
			end
		end
	end

	def letters
		@letters # фишка ruby - можно не указывать "return", метод возвращает значение переменной на последней строке
	end

	def right_letters
		@right_letters
	end

	def wrong_letters
		@wrong_letters
	end

	def status
		@status
	end

	def errors
		@errors
	end

end
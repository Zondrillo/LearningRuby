def file_reader(file_name)
	current_path = File.dirname(__FILE__)
	file_path = current_path + "/" + file_name
	file = File.new(file_path, 'r:UTF-8')
	lines = file.readlines
	file.close
	return lines
end

questions = file_reader("questions.txt")
answers = file_reader("answers.txt")

puts "Мини-викторина. Ответьте на вопросы."
right_answers = 0
i = 0
while i < questions.size do
	puts questions[i]
	answer = STDIN.gets.encode("UTF-8").chomp
	if answer == answers[i].chomp
		puts "Верный ответ!"
		right_answers += 1
	else
		puts "Неправильно. Правильный ответ: #{answers[i]}"
	end
	i += 1
end

puts "У Вас #{right_answers} правильных ответов из #{questions.size}"

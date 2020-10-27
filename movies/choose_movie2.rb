def file_reader(file_name) 
	current_path = File.dirname(__FILE__)
	file_path = current_path + "/" + file_name
	if File.exist?(file_path)
		file = File.new(file_path, 'r:UTF-8')
		lines = file.readlines
		file.close
		return lines
	else
		puts "File #{file_name} not found"
	end
end

movies = file_reader('movies.txt')
titles =[]
descriptions = []

movies.each_with_index do |movie, index|
	if index % 2 == 0
		titles << movie
	else
		descriptions << movie
	end
end

random_id = rand(titles.size - 1)

random_movie = titles[random_id] + descriptions[random_id]

puts "Сегодня Вам предлагается к просмотру фильм:\n#{random_movie}"

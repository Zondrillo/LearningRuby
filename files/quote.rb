current_path = File.dirname(__FILE__)

file_path = current_path + "/aphorisms.txt"

puts "Афоризм дня:"

if File.exist?(file_path)
	file = File.new(file_path, 'r:UTF-8')
	lines = file.readlines
	file.close
	puts lines.sample
else
	puts "File not found"
end

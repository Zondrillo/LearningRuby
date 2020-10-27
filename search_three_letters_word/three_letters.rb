current_path = File.dirname(__FILE__)
file_name = "words.txt"
file_path = current_path + "/" + file_name
if File.exist?(file_path)
	file = File.new(file_path, 'r:UTF-8')
	text = file.read
	file.close
else
	puts "File #{file_name} not found"
end

words = text.gsub(/[,\(\)\.\-;:\?\!]/, '')

regexp = /\s(\S{3})\s/i

matchObj = words.scan(regexp)

puts "Все слова из трёх букв:"
puts matchObj.uniq.join(', ')

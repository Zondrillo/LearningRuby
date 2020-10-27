if File.exist?('aphorisms.txt')
	file = File.new('aphorisms.txt', 'r:UTF-8')
	content = file.read
	puts content
else
	puts "File not found"
end

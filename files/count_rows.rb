file_name = ARGV[0]
current_path = File.dirname(__FILE__)
file_path = current_path + "/" + file_name

unless File.exist?(file_path)
	abort "File #{file_name} not found"
end

puts "File opened: #{file_path}"
file = File.new(file_path, 'r:UTF-8')
lines = file.readlines
count_empty_rows = 0
last_five_lines = []
lines.each_with_index do |line, index|
	if line == "\n" 
		count_empty_rows += 1
	elsif lines.size - index < 5
		last_five_lines << line
	end
end
file.close

puts "Total rows: #{lines.size}"
puts "Empty rows: #{count_empty_rows}"
puts "Last five rows of file:"
for line in last_five_lines do
	puts line
end

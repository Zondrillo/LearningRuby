files = ["foreheads.txt", "eyes.txt", "noses.txt", "mouths.txt"]
separator = "------------------------------"
face = []

def walker(file_name, output_face)
	current_path = File.dirname(__FILE__)
	file_path = current_path + "/" + file_name
	unless File.exist?(file_path)
		abort "File #{file_name} not found"
	end
	file = File.new(file_path, 'r:UTF-8')
	lines = file.readlines
	output_face << lines.sample
	file.close
end

for file in files do
	walker(file, face)
end

time = Time.now
current_path = File.dirname(__FILE__)
file_name = "face " + time.strftime("%Y-%m-%d, %H-%M") + ".txt"
file_with_face = File.new(current_path + "/" + file_name, "a:UTF-8")

for item in face do
	file_with_face.puts(item)
end

file_with_face.puts(separator)

file_with_face.close

puts "Лицо успешно записано в файл #{file_name}.txt"
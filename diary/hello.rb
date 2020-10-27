current_path = File.dirname(__FILE__)
file_name = "hello.txt"

file = File.new(current_path + "/" + file_name, "a:UTF-8")
file.puts("Hello, file!")
file.close

puts "Файл #{file_name} успешно создан."
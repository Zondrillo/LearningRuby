require_relative "human.rb"

human1 = Human.new("Гаврила", "Петрович", 40)
human2 = Human.new("Фёдор", "Петрович", 65)
human3 = Human.new("Василий", "Алибабаевич", 20)

puts "У нас есть три человека:"
puts human1.get_fullname
puts human2.get_fullname
puts human3.get_fullname

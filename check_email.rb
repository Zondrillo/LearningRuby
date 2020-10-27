if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

regexp = /^\S+@\w+\.[a-z]+$/i

puts "Введите email:"
email = STDIN.gets.chomp
if email =~ regexp
	puts "Спасибо!"
else
	puts "Какая-то фигня!\nЭто не email"
end

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

names = []
user_input = nil

while user_input != '' do
  user_input = gets.chomp
  names << user_input
end

for item in names do
  puts "С нами " + item
  sleep 1

  if item == 'Элис'
    puts "Элис? Кто такая Элис?"
    sleep 1
    break
  end
end

puts 'Что это за девочка и где она живет?'
sleep 1
puts 'А вдруг она не курит? А вдруг она не пьёт?'
sleep 1
puts 'А мы с такими рожами возьмем да и припрёмся к Элис... :)'

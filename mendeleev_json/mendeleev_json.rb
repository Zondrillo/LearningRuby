if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'json'

file = File.read('mendeleev.json', encoding: 'UTF-8')
elements = JSON.parse(file)

puts "У нас есть #{elements.keys.size} элементов"
puts elements.keys

element = gets.chomp

if elements.key?(element)
  puts "Первооткрыватель элемента: #{elements[element]}"
else
  puts 'Такой элемент ещё не открыт'
end

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
puts elements.keys.to_s

puts
puts 'О каком элементе хотите узнать?'
element = gets.chomp

if elements.key?(element)
  choice = elements[element]
  puts "Порядковый номер: #{choice['number']}"
  puts "Название: #{choice['name']}"
  puts "Первооткрыватель: #{choice['discoverer']} (#{choice['year']})"
  puts "Плотность: #{choice['density']} г/см³"
else
  puts 'Такой элемент ещё не открыт'
end

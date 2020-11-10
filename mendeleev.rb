if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Таблица, где символу элемента соответствует фамилия его первооткрывателя
table = {
  'H' => 'Кавендиш',
  'He' => 'Локьер, Жансен, Рамзай',
  'Li' => 'Арфведсон',
  'Be' => 'Воклен',
  'B' => 'Дэви и Гей-Люссак',
  'C' => 'неизвестен',
  'N' => 'Резерфорд',
  'O' => 'Пристли и Шееле',
  'F' => 'Муассан',
  'Ne' => 'Рамзай и Траверс'
}

puts "У нас есть #{table.keys.size} элементов"

puts table.keys

element = gets.chomp

if table.key?(element)
  puts "Первооткрыватель элемента: #{table[element]}"
else
  puts 'Такой элемент ещё не открыт'
end

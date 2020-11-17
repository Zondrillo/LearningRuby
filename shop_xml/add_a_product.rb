if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'rexml/document'

data_path = './data/goods.xml'

abort "File #{data_path} not found" unless File.exist?(data_path)

puts "Какой товар вы хотите добавить?\n0: Book\n1: Movie"
choice = $stdin.gets.chomp.to_i

product = {}

case choice
when 0
  type = 'book'
  puts 'Укажите имя автора:'
  product['author'] = $stdin.gets.chomp
  puts 'Укажите название книги:'
  product['title'] = $stdin.gets.chomp
  puts 'Укажите жанр:'
  product['genre'] = $stdin.gets.chomp
when 1
  type = 'movie'
  puts 'Укажите имя режиссёра:'
  product['director'] = $stdin.gets.chomp
  puts 'Укажите название фильма:'
  product['title'] = $stdin.gets.chomp
  puts 'Укажите год производства:'
  product['year'] = $stdin.gets.chomp
else
  abort 'Неизвестный тип продукта'
end

puts 'Укажите стоимость продукта в рублях:'
product['price'] = $stdin.gets.chomp

puts 'Укажите, сколько единиц продукта осталось на складе:'
product['in_stock'] = $stdin.gets.chomp

data_file = File.open(data_path, 'r:UTF-8')
xml = REXML::Document.new(data_file)
data_file.close

xml.root.add_element(type, product)

File.open(data_file, 'w:UTF-8') do |data_file|
  xml.write(data_file, 2)
end

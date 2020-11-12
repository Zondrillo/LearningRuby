require_relative 'lib/goods'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/goods_collection'

puts "Товары на складе:\n\r"

# чтение из файлов по имени файла
movie = Movie.from_file('01.txt')
puts movie
book = Book.from_file('01.txt')
puts book

begin
  Goods.from_file('01.txt')
rescue NotImplementedError
  puts 'Метод класса Goods.from_file не реализован'
end

# чтение из файлов по заданному типу товара
books_collection = GoodsCollection.from_dir('books')
movies_collection = GoodsCollection.from_dir('movies')

puts
puts 'Отсортировано по возрастанию цены:'
books_collection.sort('price')
puts books_collection.to_a
puts
puts 'Отсортировано по убыванию цены:'
books_collection.sort('price', false)
puts books_collection.to_a
puts
puts 'Отсортировано по названию (А-Я):'
movies_collection.sort('title')
puts movies_collection.to_a
puts
puts 'Отсортировано по названию (Я-А):'
movies_collection.sort('title', false)
puts movies_collection.to_a
puts
puts 'Отсортировано по возрастанию количества на складе:'
books_collection.sort('quantity_in_stock')
puts books_collection.to_a
puts
puts 'Отсортировано по убыванию количества на складе:'
movies_collection.sort('quantity_in_stock', false)
puts movies_collection.to_a

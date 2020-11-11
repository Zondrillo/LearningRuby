require_relative 'lib/goods'
require_relative 'lib/book'
require_relative 'lib/movie'

puts "Товары на складе:\n\r"

movie = Movie.from_file('01.txt')
puts movie
book = Book.from_file('01.txt')
puts book

begin
  Goods.from_file('01.txt')
rescue NotImplementedError
  puts 'Метод класса Goods.from_file не реализован'
end

require_relative 'lib/goods'
require_relative 'lib/book'
require_relative 'lib/movie'

movie1 = Movie.new(290, 10)

puts "Фильм Леон стоит #{movie1.get_price} руб."

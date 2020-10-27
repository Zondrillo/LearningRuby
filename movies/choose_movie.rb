require_relative "movies.rb"

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

movies_and_directors = []
puts "Фильмы какого режиссера Вы хотите посмотреть?"
director = STDIN.gets.encode("UTF-8").chomp
count = 1
while count <= 3
	puts "Какой-нибудь его хороший фильм?"
	movie = STDIN.gets.encode("UTF-8").chomp
	data = Movies.new(movie, director)
	movies_and_directors << data
	count += 1
end

random_movie = movies_and_directors.sample

puts "И сегодня вечером рекомендую посмотреть: #{random_movie.title}\nРежиссера: #{random_movie.director}"

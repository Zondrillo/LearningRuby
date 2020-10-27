require_relative "human2.rb"
require_relative "movies.rb"

people = ["Andrew", "Bob", "Julia"]
movies = ["Interstellar", "Titanic", "Terminator"]
directors = ["Cristofer Nolan", "James Cameron", "James Cameron"]

i = 0
while i < people.size
	movie = Movies.new(movies[i], directors[i])
	person = Human.new(people[i])
	person.favorite_movie = movie
	puts "#{person.get_name}\nс любимым фильмом: #{person.get_favorite_movie.title}"
	i += 1
end

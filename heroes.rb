if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Врага какого персонажа вы хотите узнать?"

hero = STDIN.gets.encode("UTF-8").chomp

case hero
when "batman", "Batman", "Бэтмен", "бэтмен"
 	puts "Джокер"
when "sherlock holmes", "Sherlock holmes", "Sherlock Holmes", "шерлок холмс", "Шерлок холмс", "Шерлок Холмс"
	puts "Профессор Мориарти"
when "Буратино", "буратино", "Buratino", "buratino"
	puts "Карабас-Барабас"
when "Фродо Бэггинс", "Фродо бэггинс", "фродо Бэггинс", "Frodo Baggins", "Frodo baggins", "frodo baggins"
	puts "Sauron"
when "Моцарт", "моцарт", "Mozart", "mozart"
	puts "Сальери"
else
	puts "Не удалось найти врага."
end
	
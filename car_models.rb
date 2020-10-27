brands = ["Lamborgini", "Ferrari", "Aston Martin", "Porsche", "Mercedes",
          "Bugatti", "Audi", "BMW", "Maseratti", "Lexus"]

puts "У нас всего " + brands.size.to_s + " машин. Вам какую?"

input = gets.to_i - 1

if input >= 0 && input < brands.size
  puts "Поздравляем, вы получили: " + brands[input].to_s
else
  puts "Извините, машины с таким номером у нас нет :("
end

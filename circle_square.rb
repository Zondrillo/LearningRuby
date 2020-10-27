def circle_square(radius)
  pi = 3.14159265
  result = pi * radius ** 2
  return "Площадь круга: " + result.round(2).to_s
end

puts "Введите радиус круга:"

user_input = STDIN.gets.to_f

puts circle_square(user_input)

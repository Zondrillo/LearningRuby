require_relative "bodybuilder.rb"

def upgrade(bodybuilder)
  puts "Какую мышцу будем качать?"
  puts "1 - Бицепс\n2 - Трицепс\n3 - Дельтавидная\n"
  user_input = STDIN.gets.to_i
  bodybuilder.upgrade_muscle(user_input)
end

bodybuilder1 = Bodybuilder.new
bodybuilder2 = Bodybuilder.new
bodybuilder3 = Bodybuilder.new

while true
  puts "У нас есть 3 бодибилдера. Которого будем тренировать?"
  puts "Первый бодибилдер:"
  puts bodybuilder1.status
  puts "Второй бодибилдер:"
  puts bodybuilder2.status
  puts "Третий бодибилдер:"
  puts bodybuilder3.status
  puts "Введите 1, 2 или 3."

  user_input = STDIN.gets.to_i
  case user_input
  when 1
    upgrade(bodybuilder1)
  when 2
    upgrade(bodybuilder2)
  when 3
    upgrade(bodybuilder3)
  else
    puts "Такого бодибилдера у нас нет :("
    puts
  end
end

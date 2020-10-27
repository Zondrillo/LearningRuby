puts "Какая у вас на руках валюта?"
puts "1. Рубли"
puts "2. Доллары"
currency = gets.chomp.to_i

puts "Сколько сейчас стоит 1 доллар в рублях?"
exchange_rate = gets.chomp.to_f

if currency == 1
  puts "Сколько  у вас рублей?"
  my_money = gets.chomp.to_f
  dollars = (my_money / exchange_rate).round(2)
  puts "Ваши запасы равны: " + dollars.to_s + " $"
else
  puts "Сколько  у вас долларов?"
  my_money = gets.chomp.to_f
  rubles = (my_money * exchange_rate).round(2)
  puts "Ваши запасы равны: " + rubles.to_s + " руб."
end

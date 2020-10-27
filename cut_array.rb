def cut_array(number, some_array)
  new_array = []
  if number < some_array.length
    count = 0
    while count < number
      new_array << some_array[count]
      count += 1
    end
    return "Вот Ваша колбаса:\n" + new_array.to_s
  else
    return "Вот Ваша колбаса:\n" + some_array.to_s
  end
end

origin = (1..11).to_a
puts "Вот какая палка колбасы у нас есть:"
puts origin.to_s
puts "Сколько первых элементов вам отрезать?"
user_input = STDIN.gets.to_i

puts cut_array(user_input, origin)

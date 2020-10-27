men = ["Gena", "George", "Misha"]
women = ["Katrin", "Liza", "Masha"]

all = men + women

puts "Men: " + men.to_s
puts "Women: " + women.to_s
puts "All together: " + all.to_s

origin = [1, 2, 3, 4, 5]
reversed = origin.reverse
puts "Origin array: " + origin.to_s
puts "Reversed array: " + reversed.to_s
origin.reverse!
puts "Origin array after reverse! - " + origin.to_s

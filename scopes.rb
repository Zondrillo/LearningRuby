$a = 0
b = 1

def method
  c = 2
  puts "Переменная '$a': #{defined? $a}"
  puts "Переменная 'b': #{defined? b}"
  puts "Переменная 'c': #{defined? c}"
end

puts "Переменная '$a': #{defined? $a}"
puts "Переменная 'b': #{defined? b}"
puts "Переменная 'c': #{defined? c}"

method

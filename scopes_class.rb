variable = 0

class MyClass

  def initialize
    @variable = 0
  end

  def check_variables
    puts "Переменная 'variable': #{defined? variable}"
    puts "Переменная '@variable': #{defined? @variable}"
  end

end

m1 = MyClass.new
m1.check_variables

puts "Переменная 'variable': #{defined? variable}"
puts "Переменная '@variable': #{defined? @variable}"

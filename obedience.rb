class Parent

  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def obedient?
    true
  end

end

class Child < Parent

  def obedient?
    false
  end

end


parent1 = Parent.new('Василий Игоревич')
child1 = Child.new('Маша')
child2 = Child.new('Коля')

puts "#{parent1.get_name} послушный: #{parent1.obedient?}"
puts "#{child1.get_name} послушная: #{child1.obedient?}"
puts "#{child2.get_name} послушный: #{child2.obedient?}"

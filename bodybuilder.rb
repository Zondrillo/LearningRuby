class Bodybuilder

  def initialize
    @biceps = 0
    @triceps = 0
    @delta = 0
  end

  def upgrade_muscle(muscle)
    case muscle
    when 1
      @biceps += 1
    when 2
      @triceps += 1
    when 3
      @delta += 1
    else
      puts "Это что за мышца?"
    end
  end

  def status
    puts "Бицепсы: #{@biceps}"
    puts "Трицепсы: #{@triceps}"
    puts "Дельтовидные: #{@delta}"
    puts
  end
end

class Chameleon

  def initialize
    @colour = nil
  end

  def change_colour(new_colour)
    @colour = new_colour
    puts "Now I'm #{@colour}"
  end

end

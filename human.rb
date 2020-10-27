class Human

  def initialize(first_name, middle_name, age)
    @first_name = first_name
    @middle_name = middle_name
    @age = age
    @old = false
  end

  def old?
    if @age > 60
      @old = true
    end
  end

  def get_fullname
    if old?
      return "#{@first_name} #{@middle_name}\nИ ему #{@age} - пожилой"
    else
      return "#{@first_name}\nИ ему #{@age} - молодой"
    end
  end

end

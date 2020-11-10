class Link < Post

  def initialize
    super
    @url = ''
  end

  def read_from_console
    puts 'Адрес ссылки:'
    @url = $stdin.gets.chomp
    puts 'Введите описание ссылки:'
    @text = $stdin.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y-%m-%d, %H-%M-%S')} \n\r \n\r"
    [@url, @text, time_string]
  end

end

class Movie < Goods

  attr_accessor :year, :director

  def self.from_file(file_name)
    file_path = "./data/movies/#{file_name}"
    if File.exist?(file_path)
      file = File.open(file_path, 'r:UTF-8')
      data = file.readlines.map(&:chomp)
      file.close
      new(data[3], data[4], data[0], data[2], data[1])
    else
      "File #{file_path} not found"
    end
  end

  def initialize(price, quantity_in_stock, title, year, director)
    super price, quantity_in_stock, title
    @year = year
    @director = director
  end

  def to_s
    "Фильм \"#{title}\", #{year}, реж. - #{director}, цена: #{price} руб. (Осталось #{quantity_in_stock})"
  end

end

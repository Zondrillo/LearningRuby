class Book < Goods

  attr_accessor :genre, :author

  def self.from_file(file_name)
    file_path = "./data/books/#{file_name}"
    if File.exist?(file_path)
      file = File.open(file_path, 'r:UTF-8')
      data = file.readlines.map(&:chomp)
      file.close
      new(data[3], data[4], data[0], data[1], data[2])
    else
      "File #{file_path} not found"
    end
  end

  def initialize(price, quantity_in_stock, title, genre, author)
    super price, quantity_in_stock, title
    @genre = genre
    @author = author
  end

  def to_s
    "Книга \"#{title}\", #{genre}, автор - #{author}, цена: #{price} руб. (Осталось #{quantity_in_stock})"
  end

end

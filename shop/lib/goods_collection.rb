class GoodsCollection

  attr_accessor :collection

  def self.from_dir(type)
    list = GoodsCollection.new
    dir_path = "./data/#{type}"
    if Dir.exist?(dir_path)
      Dir.each_child(dir_path).each do |file_name|
        file = File.open("#{dir_path}/#{file_name}", 'r:UTF-8')
        data = file.readlines.map(&:chomp)
        file.close
        case type
        when 'books'
          list.collection << Book.new(data[3].to_i, data[4].to_i, data[0], data[1], data[2])
        when 'movies'
          list.collection << Movie.new(data[3].to_i, data[4].to_i, data[0], data[2], data[1])
        else
          "Unknown type - #{type}"
        end
      end
      list
    else
      "Directory #{dir_path} not found"
    end
  end

  def initialize
    @collection = []
  end

  def to_a
    @collection
  end

  def sort(param, ascend = true)
    case param
    when 'price', 'quantity_in_stock', 'title'
      if ascend
        @collection.sort_by!(&:"#{param}")
      else
        @collection.sort_by!(&:"#{param}").reverse!
      end
    else
      "Unknown parameter - #{param}"
    end
  end

end

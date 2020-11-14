class GoodsCollection

  attr_accessor :collection

  def self.from_xml(file_name)
    list = GoodsCollection.new
    target_path = "./data/#{file_name}"
    abort "File #{file_name} not found" unless File.exist?(target_path)
    file = File.new(target_path)
    doc = REXML::Document.new(file)
    file.close
    doc.root.elements.each do |item|
      case item.name
      when 'book'
        list.collection << Book.new(item['price'].to_i, item['in_stock'].to_i, item['title'], item['genre'], item['author'])
      when 'movie'
        list.collection << Movie.new(item['price'].to_i, item['in_stock'].to_i, item['title'], item['year'], item['director'])
      else
        "Unknown type - #{item.name}"
      end
    end
    list
  end

  def initialize
    @collection = []
  end

  def buy
    all_goods = GoodsCollection.from_xml('goods.xml')
    total = 0
    loop do
      all_goods.collection.delete_if { |item| item.quantity_in_stock.zero? }
      break if all_goods.collection.empty?

      puts 'Что хотите купить?'
      all_goods.collection.each_with_index do |item, index|
        puts "#{index}: #{item}"
      end
      puts 'x: Покинуть магазин'
      user_input = gets.chomp
      break unless user_input != 'x'

      if (0..all_goods.collection.size - 1).include?(user_input.to_i)
        all_goods.collection[user_input.to_i].quantity_in_stock -= 1
        total += all_goods.collection[user_input.to_i].price
      end
    end
    if total.zero?
      'Решили просто посмотреть?'
    else
      "Спасибо за покупку, с Вас #{total} руб."
    end
  end

end

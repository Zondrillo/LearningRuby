class Goods

  attr_accessor :price, :quantity_in_stock, :title

  def self.from_file(file_name)
    raise NotImplementedError
  end

  def initialize(price, quantity_in_stock, title)
    @price = price
    @quantity_in_stock = quantity_in_stock
    @title = title
  end

end

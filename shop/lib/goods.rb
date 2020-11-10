class Goods

  def initialize(price, quantity_in_stock)
    @price = price
    @quantity_in_stock = quantity_in_stock
  end

  def get_price
    @price
  end

  def get_quantity_in_stock
    @quantity_in_stock
  end

end

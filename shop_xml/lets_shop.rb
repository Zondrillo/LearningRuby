require 'rexml/document'
require_relative 'lib/goods'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/goods_collection'

purchases = GoodsCollection.new
puts purchases.buy

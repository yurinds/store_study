require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)

collection = ProductCollection.from_dir(current_path)

products = collection.sort!(field: :price, type: :desc).to_a

puts 'Вот какие товары у нас есть:'

products.each do |item|
  puts item
end

## Пытаемся вызвать метод from_file у класса Product и ловим ошибку
# begin
#  Product.from_file(current_path + '/data/films/01.txt')
# rescue NotImplementedError
#  puts 'Метод класса Product.from_file не реализован'
# end
#

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/cart'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)
collection = ProductCollection.from_dir(current_path)

abort 'Увы, все товары закончились :(' if collection.empty?

collection.sort!(field: :title)

client_cart = Cart.new

until collection.empty?
  puts 'Что хотите купить:'
  puts
  puts collection
  puts '0. Выход'

  user_input = ''
  user_input = STDIN.gets.strip until collection.valid_range.include?(user_input)

  break if user_input == '0' # сразу ввели 0, значит отправляем на выход

  input_index = user_input.to_i - 1
  input_product = collection.find(input_index)
  collection.sale_product(input_product)

  puts
  puts "Вы выбрали: #{input_product}"
  puts

  client_cart.add_to_cart(input_product)
end

unless client_cart.empty?
  puts 'Вы купили:'
  puts client_cart
  puts "С Вас — #{client_cart.sum} руб. Спасибо за покупки!"
end

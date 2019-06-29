require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/cart'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)

collection = ProductCollection.from_dir(current_path)

products = collection.sort!(field: :price, type: :desc).to_a

if products.empty?
  puts 'Увы, все товары закончились :('
else

  user_input = ''

  client_cart = Cart.new

  until user_input == '0'

    puts 'Что хотите купить:'
    puts

    products.each.with_index(1) do |product, index|
      puts "#{index}. #{product}"
    end

    puts '0. Выход'

    user_input = STDIN.gets.strip
    next if user_input == '0' # сразу ввели 0, значит отправляем на выход

    # ввели строку, уведомляю и отправляю на следующий виток цикла
    if user_input.to_i == 0
      puts 'Введите номер позиции, которую хотите приобрести!'
      next
    end

    product_index = user_input.to_i - 1

    unless products[product_index]
      puts 'Введенной позиции нет в списке!'
      next
    end

    # уменьшить кол во надо уже здесь
    puts
    puts "Вы выбрали: #{products[product_index]}"
    puts

    client_cart.add_to_cart(products[product_index])
  end

end

cart = client_cart.to_a
unless cart.empty?
  puts 'Вы купили:'
  cart.each do |item|
    puts item
  end
  puts
  puts "С Вас — #{client_cart.sum} руб. Спасибо за покупки!"
end

## Пытаемся вызвать метод from_file у класса Product и ловим ошибку
# begin
#  Product.from_file(current_path + '/data/films/01.txt')
# rescue NotImplementedError
#  puts 'Метод класса Product.from_file не реализован'
# end
#

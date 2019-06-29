require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/cart'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)

collection = ProductCollection.from_dir(current_path)

products = collection.sort!(field: :title).to_a

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

    input_product = products[product_index]
    unless input_product
      puts 'Введенной позиции нет в списке!'
      puts
      next
    end

    input_product.correct_balance
    collection.correct_collection(input_product)
    products = collection.sort!(field: :title).to_a

    puts
    puts "Вы выбрали: #{input_product}"
    puts

    client_cart.add_to_cart(input_product)
  end

end

cart = client_cart.to_h
unless cart.empty?
  puts 'Вы купили:'
  cart.each do |product, quantity|
    puts "#{quantity} x #{product}"
  end
  puts
  puts "С Вас — #{client_cart.sum} руб. Спасибо за покупки!"
end

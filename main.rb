require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

film1 = Film.new(title: 'Леон', director: 'Люк Бессон', year: '1994', price: 990, balance: 5)
film2 = Film.new(title: 'Дурак', director: 'Юрий Быков', year: '2014', price: 390, balance: 1)
book  = Book.new(title: 'Идиот', author: 'Федор Достоевский', genre: 'роман', price: 1500, balance: 10)

products = [film1, film2, book]

puts 'Вот какие товары у нас есть:'

products.each do |item|
  puts item
end

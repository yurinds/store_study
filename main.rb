require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

current_path = File.dirname(__FILE__)

film1 = Film.from_file(current_path + '/data/films/1.txt')
# film2 = Film.new(title: 'Дурак', director: 'Юрий Быков', year: '2014', price: 390, balance: 1)
book = Book.from_file(current_path + '/data/books/1.txt')

book1 = Book.from_file('/data/books/1.txt')

products = [film1, book]

puts 'Вот какие товары у нас есть:'

products.each do |item|
  puts item
end

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
    Product.from_file(current_path + '/data/films/01.txt')
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
  end

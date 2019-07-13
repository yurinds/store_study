class Cart
  attr_accessor :products

  def initialize
    @products = {}
  end

  def add_to_cart(product)
    @products[product] ||= 0
    @products[product] += 1
  end

  def to_s
    text = ''
    @products.each do |product, quantity|
      text += "#{quantity} x #{product}\n"
    end
    text
  end

  def empty?
    @products.empty?
  end

  def sum
    sum = 0
    @products.each { |product, quantity| sum += quantity * product.price }
    sum
  end
end

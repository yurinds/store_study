class Cart
  attr_accessor :products

  def initialize
    @products = {}
  end

  def add_to_cart(product)
    if @products[product]
      @products[product] += 1
    else
      @products[product] = 1
    end
  end

  def to_h
    @products
  end

  def sum
    sum = 0
    @products.each { |product, quantity| sum += quantity * product.price }
    sum
  end
end

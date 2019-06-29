class Cart
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_to_cart(product)
    @products << product
  end

  def to_a
    @products
  end

  def sum
    @products.sum(&:price)
  end
end

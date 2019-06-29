class Product
  attr_reader :price, :balance

  def initialize(params)
    @price = params[:price]
    @balance = params [:balance]
  end
end

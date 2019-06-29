class Product
  attr_accessor :price, :balance

  def initialize(params)
    @price = params[:price]
    @balance = params [:balance]
  end

  def self.from_file(_file_path)
    raise NotImplementedError
  end
end

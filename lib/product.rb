class Product
  attr_accessor :price, :balance

  def initialize(params)
    @price = params[:price].to_i
    @balance = params [:balance].to_i
  end

  def self.from_file(_file_path)
    raise NotImplementedError
  end
end

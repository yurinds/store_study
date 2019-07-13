class ProductCollection
  attr_reader :collection

  def initialize(products = [])
    @collection = products
  end

  def self.from_dir(current_path)
    products = []
    class_hash = { 'films' => Film, 'books' => Book, 'discs' => Disk }

    Dir.new('data').each do |data_path|
      next if ['.', '..'].include?(data_path)
      next unless %w[films books discs].include?(data_path)

      Dir.new("data/#{data_path}").each do |dir_path|
        next if ['.', '..'].include?(dir_path)

        full_path = current_path + "/data/#{data_path}/" + dir_path

        products << class_hash[data_path].from_file(full_path) if File.exist?(full_path)
      end
    end

    # удаляю, если количество = 0
    products.each do |product|
      products.delete(product) if product.balance == 0
    end

    new(products)
  end

  def sort!(params)
    case params[:field]
    when :title then @collection.sort_by!(&:title)
    when :price then @collection.sort_by!(&:price)
    when :balance then @collection.sort_by!(&:balance)
    end

    @collection.reverse! if params[:type] == :desc

    self
  end

  def to_a
    @collection
  end

  def empty?
    @collection.empty?
  end

  def find(index)
    @collection[index]
  end

  def sale_product(product)
    product.update_balance
    @collection.delete(product) if product.balance == 0
  end

  def valid_range
    ('0'..@collection.size.to_s)
  end

  def to_s
    text = ''
    @collection.each.with_index(1) do |product, index|
      text += "#{index}. #{product}\n"
    end
    text
  end
end

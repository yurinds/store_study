class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга \"#{title}\", #{genre}, автор - #{author}, #{price} руб. (осталось #{balance})"
  end

  def self.from_file(path)
    book = File.readlines(path, chomp: true)

    new(
      title: book[0],
      genre: book[1],
      author: book[2],
      price: book[3],
      balance: book[4]
    )
  end
end

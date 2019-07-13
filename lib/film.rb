class Film < Product
  attr_accessor :title, :director, :year

  def initialize(params)
    super
    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм \"#{title}\", #{year}, реж. #{director}, #{price} руб. (осталось #{balance})"
  end

  def self.from_file(path)
    film = File.readlines(path, chomp: true)

    new(
      title: film[0],
      director: film[1],
      year: film[2],
      price: film[3],
      balance: film[4]
    )
  end
end

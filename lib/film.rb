class Film < Product
  attr_reader :title, :director, :year

  def initialize(params)
    super
    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    text = "Фильм \"#{title}\", #{year}, реж. #{director}, #{price} руб. (осталось #{balance})"
 end
end

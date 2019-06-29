class Book < Product
  attr_reader :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    text = "Книга \"#{title}\", #{genre}, автор - #{author}, #{price} руб. (осталось #{balance})"
 end
end

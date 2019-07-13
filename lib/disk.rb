class Disk < Product
  attr_accessor :title, :band, :genre, :year

  def initialize(params)
    super
    @title = params[:title]
    @band = params[:band]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{band} - \"#{title}\", #{genre}, #{year}, #{price} руб. (осталось #{balance})"
  end

  def self.from_file(path)
    disk = File.readlines(path, chomp: true)

    new(
      title: disk[0],
      band: disk[1],
      genre: disk[2],
      year: disk[3],
      price: disk[4],
      balance: disk[5]
    )
  end
end

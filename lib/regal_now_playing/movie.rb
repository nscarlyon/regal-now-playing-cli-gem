class RegalNowPlaying::Movie

  attr_accessor :name, :rating, :runtime, :genre, :info

  @@all = []

  def initialize(title = "title", rating = "pg", runtime = "1 hr", genre = "comedy", info = "more info")
    @title = title
    @rating = rating
    @runtime = runtime
    @genre = genre
    @info = info
    @@all << self
  end

  def self.all
    @@all
  end

end

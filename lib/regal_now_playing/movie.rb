class RegalNowPlaying::Movie

  attr_accessor :name, :rating, :runtime, :genre, :info

  @@all = []

  def initialize(title = "title", rating = "pg", runtime = "1 hr", genre = "comedy", showtimes = "show")
    @title = title
    @rating = rating
    @runtime = runtime
    @genre = genre
    @showtimes = showtimes
    @@all << self
  end

  

  def showtimes=(showtimes)
    @showtimes = doc.css("time.timeInfo").text
  end

  def rating_and_runtime
    #Raiting comes first and then it is seperated by a comma
    @placeholder = doc.css("div.showtimes-movie-rating-runtime").text
  end

  def genre=(genre)
    @genre = div.showtimes-movie-genre
  end

  def self.all
    @@all
  end

end

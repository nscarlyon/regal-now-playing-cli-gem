class RegalNowPlaying::Movie

  attr_accessor :tilte, :index, :rating, :runtime, :genre, :showtimes, :doc

  @@all = []

  def initialize(title = nil, index = nil, rating = nil, runtime = nil, genre = nil, showtimes = nil)
    @title = title
    @index = index
    @rating = rating
    @runtime = runtime
    @genre = genre
    @showtimes = showtimes
    @@all << self
  end

  def self.new_from_index(input)
    new_movie = self.new
    new_movie.index = input.to_i-1
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find
    self.all[@index]
  end

  def self.page
    @doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
  end

  def showtimes
    @showtimes ||= doc.css("div.showtimes-times")[0].text
  end

  def rating_and_runtime
    #Raiting comes first and then it is seperated by a comma
    @placeholder = doc.css("div.showtimes-movie-rating-runtime").text
  end

  def genre=(genre)
    @genre = div.showtimes-movie-genre
  end

end

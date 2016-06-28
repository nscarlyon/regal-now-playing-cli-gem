class RegalNowPlaying::Movie

  attr_accessor :title, :rating_and_runtime, :genre, :showtimes, :index
  attr_reader :doc

  def initialize(index = nil)
    @index = index
  end

  def doc
    @doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
  end

  def self.scrape_titles
    doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    titles ||= doc.css("a.dark.showtimes-movie-title").map(&:text)
  end

  def title
    @title ||= doc.css("a.dark.showtimes-movie-title")[index].text
  end

  def genre
    @genre ||= doc.css("div.showtimes-movie-genre")[index].text.gsub(/\W{3,}/, " ")
  end

  def rating_and_runtime
    @rating_and_runtime ||= doc.css("div.showtimes-movie-rating-runtime")[index].text.gsub(/\W{3,}/, " ")
  end

  def showtimes
    @showtimes ||= doc.css("div.showtimes-times")[index].text.gsub(/\W{3,}/, " ")
  end

end

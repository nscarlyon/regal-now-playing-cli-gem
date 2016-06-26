require 'pry'

class RegalNowPlaying::Scraper

attr_accessor :title, :doc

  def make_movies
    doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))

    title = doc.css("a.dark.showtimes-movie-title").text.split(" ")
    title.each {|m| puts m}
    binding.pry
  #      RegalNowPlaying::Movie.new_from_titles(m)
  end

end #ends class

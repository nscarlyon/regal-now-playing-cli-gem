require 'pry'

class RegalNowPlaying::Scraper

attr_accessor :title, :rating, :genre

def self.get_page
  doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
   binding.pry
end

  def make_movies
    doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    title = doc.css("a.dark.showtimes-movie-title").map(&:text)
      title.each_with_index do |t, i|
      #  RegalNowPlaying::Movie.new_movie("#{t}")
        puts "#{i+1}. #{t}"
      end

      showtimes = doc.css("div.showtimes-times")[0].text
      print "#{showtimes}"

    #  rating = doc.css("div.showtimes-movie-rating-runtime").text.split(", ")
    #    rating.each do |r|
    #    print "#{r}"

    #  genre = doc.css("div.showtimes-movie-genre").text
    #    puts "#{genre}"
      end


# movie times = doc.css("time.timeInfo").text
#

end #ends class

require 'pry'

class RegalNowPlaying::Scraper

attr_accessor :title, :showtimes, :doc

def self.get_page
  doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
   # binding.pry
end

  def make_movies
    @doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    title = doc.css("a.dark.showtimes-movie-title").map(&:text)
    genres = []
    genre = doc.css("div.showtimes-movie-genre").text.split
      genre.each_with_index do |g, num|
        genres << {num: g}
      end

      title.each_with_index do |t, i|

        puts "#{i+1}. #{t} --------- #{genres[i].values.join}-----------"
      end
    end

    def showtimes(input)
      showtimes = doc.css("div.showtimes-times")[input].text
       print "#{showtimes}"
     end


end #ends class

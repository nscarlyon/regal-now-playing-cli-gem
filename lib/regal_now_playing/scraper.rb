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
    genre = doc.css("div.showtimes-movie-genre").map(&:text)
      genre.each_with_index { |g, num|
        gen = {num: g}
        genres << gen
      }

      ratings = []
      rating = doc.css("div.showtimes-movie-rating-runtime").map(&:text)
        rating.each_with_index { |r, num|
          rat = {num: r}
          ratings << rat
      }

      title.each_with_index { |t, i|
        puts "#{i+1}. #{t} ----- #{genres[i].values.join.gsub(/\W{3,}/, "")} ----- #{ratings[i].values.join.gsub(/\W{3,}/, " ")}"
      }


    def info(input)
      genre = doc.css("div.showtimes-movie-genre")[input].text.gsub(/\W{3,}/, " ")
      showtimes = doc.css("div.showtimes-times")[input].text.gsub(/\W{3,}/, " ")
      rating = doc.css("div.showtimes-movie-rating-runtime")[input].text.gsub(/\W{3,}/, " ")
      puts "Genre: #{genre}"
      puts "Rating & Runtime: #{rating}"
      puts ""
      puts "------------Showtimes------------"
      puts " -#{showtimes}- "
     end
end
end

class RegalNowPlaying::Scraper

attr_accessor :title, :showtimes, :doc

def self.get_page
  doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
end

  def make_movies
    @doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    title = doc.css("a.dark.showtimes-movie-title").map(&:text)

      title.each_with_index { |t, i|
        puts "#{i+1}. #{t}"
      }

    def info(input)
      genre = doc.css("div.showtimes-movie-genre")[input].text.gsub(/\W{3,}/, " ")
      showtimes = doc.css("div.showtimes-times")[input].text.gsub(/\W{3,}/, " ")
      rating = doc.css("div.showtimes-movie-rating-runtime")[input].text.gsub(/\W{3,}/, " ")
      title = doc.css("a.dark.showtimes-movie-title")[input].text

      puts "Title: #{title}"
      puts "Genre: #{genre}"
      puts "Rating & Runtime: #{rating}"
      puts ""
      puts "------------Showtimes------------"
      puts " -#{showtimes}- "
     end
end
end

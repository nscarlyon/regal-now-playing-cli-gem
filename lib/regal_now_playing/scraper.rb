require 'pry'

class RegalNowPlaying::Scraper

attr_accessor :title

def self.get_page
  doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
   # binding.pry
end

  def make_movies
    doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    title = doc.css("a.dark.showtimes-movie-title").map(&:text)
      title.each_with_index do |t, i|
        RegalNowPlaying::Movie.new("#{t}", i)
        puts "#{i+1}. #{t}"
      end
    end


end #ends class

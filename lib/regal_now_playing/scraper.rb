class RegalNowPlaying::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
  end

  def scrape_movies_titles
    # scrape movie titles class here self.get_page.css("")
  end

  def make_movies
#will create movies using titles from scrape    scrape_movies_titles.each do |m|
#      RegalNowPlaying::Movie.new_from_titles(m)
  #  end
  puts "1. movie"
  puts "2. movie"
  puts "3. movie"
  end

end #ends class

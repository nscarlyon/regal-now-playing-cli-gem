class RegalNowPlaying::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
  end

  def scrape_movies_index
    self.get_page.css("div#t1-50 li")
  end

  def make_movies
    scrape_movies_index.each do |m|
      RegalNowPlaying::Movie.new_from_index_page(m)
    end
  end
end

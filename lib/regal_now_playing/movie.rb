class RegalNowPlaying::Movie

  attr_accessor :title, :rating_and_runtime, :genre, :showtimes, :index
  attr_reader :doc

@@all = []

  def initialize(index = nil)
    @index = index
  end

  def self.all
    @@all ||= scrape_titles
  end

  def self.find(id)
    self.all[id-1]
  end

  def doc
    @doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
  end

  def self.scrape_titles
    doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    titles ||= doc.css("a.dark.showtimes-movie-title").map(&:text)
  end

  def title
    @title ||= doc.css("a.dark.showtimes-movie-title")[self.index].text
  end

      def info(input)
        genre ||= doc.css("div.showtimes-movie-genre")[input].text.gsub(/\W{3,}/, " ")
        showtimes ||= doc.css("div.showtimes-times")[input].text.gsub(/\W{3,}/, " ")
        rating_and_runtime ||= doc.css("div.showtimes-movie-rating-runtime")[input].text.gsub(/\W{3,}/, " ")
        title ||= doc.css("a.dark.showtimes-movie-title")[input].text

        puts ""
        puts "Title: #{title}"
        puts "Genre: #{genre}"
        puts "Rating & Runtime: #{rating_and_runtime}"
        puts ""
        puts "------------Showtimes------------"
        puts " -#{showtimes}- "
       end
  end

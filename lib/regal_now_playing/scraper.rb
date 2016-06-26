require 'pry'

class RegalNowPlaying::Scraper

attr_accessor :title

def self.get_page
  doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
end

  def make_movies
    doc = Nokogiri::HTML(open("http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage"))
    title = doc.css("a.dark.showtimes-movie-title").text
    new_title = title.scan(/[A-Z][a-z]+/) {|w| print "#{w} "}
  #  new_title.each {|m| print m}
  #      RegalNowPlaying::Movie.new_from_titles(m)
  end



#The ShallowsFree State of JonesIndependence Day: Resurgence 3DIndependence D
#ay: ResurgenceThe Neon DemonCentral IntelligenceFinding Dory 3DFinding DoryUdta 
#PunjabNow You See Me 2The Conjuring 2Warcraft 3DWarcraftMe Before YouTeenage Mut
#ant Ninja Turtles: Out of the ShadowsAlice Through the Looking GlassX-Men: Apoca
#lypseCaptain America: Civil WarThe Jungle Book"     

end #ends class

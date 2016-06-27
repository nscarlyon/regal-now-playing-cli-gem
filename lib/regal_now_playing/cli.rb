
class RegalNowPlaying::CLI

  def call
    puts "Welcome to the Regal Now Playing CLI Gem"
    puts ""
    start
    options
  end

  def start
    # html http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage
    puts "Here are the movies showing today at Regal Medlock Crossing Stadium 18 & RPX:"
    puts ""
    movies = RegalNowPlaying::Scraper.new
    movies.make_movies
    puts ""

    puts "Enter the number of the movie you would like more information on:"
    input = gets.strip.to_i - 1
    movies.showtimes(input)
end

def options
    puts ""
    puts "Enter Y, if you would like to pick another movie."
    puts "Enter N, if you would like to exit."
    input = gets.strip.downcase

    if input == "y"
      start
    else
      puts "Goodbye! Have a nice day!"
      exit
    end
  end

    def print_movie(movie)
        puts ""
    #    puts "----------- #{movie.title} ------------"
        puts ""
        puts "Showtimes: #{movie.showtimes}"
#        puts "Rating: #{movie.rating}"
#        puts "Runtime: #{movie.runtime}"
#        puts "Genre: #{movie.genre}"
#        puts "More Info: #{movie.info}"
      end

end

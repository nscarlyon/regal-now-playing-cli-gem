
class RegalNowPlaying::CLI

  def call
    puts "Welcome to the Regal Now Playing Gem"
    start
  end

  def start
    # html http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage
    puts "Here are the movies showing today at Regal Medlock Crossing Stadium 18 & RPX:"
    puts ""
    movies = RegalNowPlaying::Scraper.new
    movies.make_movies
    puts ""

    puts "Enter the number of the movie you would like more information on or type exit?"
    input = gets.strip.to_i - 1
    movies.showtimes(input)


  end

  def menu



    while input != "exit"
    #  movie = RegalNowPlaying::Movie.new
    #  movie.showtimes(input)
    #  print_movie(movie)

      puts ""
      puts "Would you like to see another movie? Enter Y or N:"
      input = gets.strip.downcase

      if input == "y"
        list_movies
        menu
      else
        puts "Goodbye! Have a nice day!"
        exit
      end
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


class RegalNowPlaying::CLI

  def call
    list_movies
    menu
    puts "Goodbye!"
  end

  def list_movies
    # html http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage
    puts "Here are the movies showing today at Regal Medlock Crossing Stadium 18 & RPX:"
    RegalNowPlaying::Scraper.new.make_movies
  end

  def menu
    puts "Enter the number of the movie you would like more information on or type exit?"

      input = gets.strip.downcase
    while input != "exit"
      movie = RegalNowPlaying::Movie.new
      print_movie(movie)

      puts ""
      puts "Would you like to see another movie? Enter Y or N:"
      input = gets.strip.downcase

      if input == "y"
        list_movies
      else
        puts "Goodbye! Have a nice day!"
        exit
      end
    end
  end

    def print_movie(movie)
        puts ""
        puts "----------- #{movie.name} ------------"
        puts ""
  #      puts "Rating:           #{movie.rating}"
  #      puts "Runtime:          #{movie.runtime}"
  #      puts "Genre:      #{movie.genre}"
  #      puts "More Info:      #{movie.info}"
      end

end

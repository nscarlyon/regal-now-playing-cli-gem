
class RegalNowPlaying::CLI

  def call
    RegalNowPlaying::Scraper.new.make_movies
    list_movies
    menu
    "Goodbye!"
  end

  def list_movies
    # html http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage
    puts "Here are the movies showing today at Regal Medlock Crossing Stadium 18 & RPX:"
    puts "movies here"
  end

  def menu
    puts "Enter the number of the movie you would like more information on or type exit?"

    while input != "exit"
      input = gets.strip.downcase
      movie = RegalNowPlaying::Movie.find(input.to_i)
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
        puts "----------- #{movie.name} - #{movie.position} -----------"
        puts ""
        puts "Rating:           #{movie.rating}"
        puts "Runtime:          #{movie.runtime}"
        puts "Genre:      #{movie.genre}"
        puts "More Info:      #{movie.info}"
      end

end

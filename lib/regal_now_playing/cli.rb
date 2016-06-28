
class RegalNowPlaying::CLI

  def call
    puts "Welcome to the Regal Now Playing CLI Gem"
    puts ""
    start
  end

  def start
    # html http://www.fandango.com/regalmedlockcrossingstadium1826rpx_aamem/theaterpage
    puts "Here are the movies showing today at Regal Medlock Crossing Stadium 18 & RPX:"
    puts ""
    RegalNowPlaying::Movie.scrape_titles.each_with_index do |t, i|
      puts "#{i+1}. #{t}"
    end

    puts ""
    movies = RegalNowPlaying::Movie.new
    puts "Enter the number of the movie you would like more information on:"
    input = gets.strip.to_i - 1
    movies.info(input)

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

end

  #  def print_movie(movie)
    #    puts ""
    #    puts "----------- #{movie.title} ------------"
    #    puts ""
        #        puts "Genre: #{movie.genre}"
        #        puts "Rating and Runtime: #{movie.rating}"
    #    puts "----------- #{movie.title} ------------"
        # {movie.showtimes}

    #  end

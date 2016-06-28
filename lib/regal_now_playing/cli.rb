
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
    print "Enter the number of the movie you would like more information on:"
    index = gets.strip.to_i - 1
    movies = RegalNowPlaying::Movie.new(index)
    print_movie(movies)

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

  def print_movie(movies)
    puts ""
    puts "Title: #{movies.title}"
    puts "Genre: #{movies.genre}"
    puts "Rating & Runtime: #{movies.rating_and_runtime}"

  end
end

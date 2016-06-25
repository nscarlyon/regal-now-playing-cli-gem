require_relative './lib/regal_now_playing/version'

Gem::Specification.new do |s|
  s.name        = 'regal-now-playing'
  s.version     = RegalNowPlaying::VERSION
  s.date        = '2016-06-27'
  s.summary     = "Shows movies playing now at Regal Medlock Crossing Stadium 18 & RPX"
  s.description = "Provides details on movies"
  s.authors     = ["Natasha Carlyon"]
  s.email       = 'natasha.carlyon@gmail.com'
  s.files       = ["lib/regal_now_playing.rb", "lib/regal_now_playing/cli.rb", "lib/regal_now_playing/scraper.rb", "lib/regal_now_playing/movie.rb", "config/environment.rb"]
  s.license     = 'MIT'
  s.executables << 'regal-now-playing'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end

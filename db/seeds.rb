require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'
url2 = 'https://tmdb.lewagon.com/movie/popular'
url3 = 'https://tmdb.lewagon.com/movie/now_playing'
Movie.destroy_all
20.times do |i|
  puts "importing #{i + 1} films from API"
  movies = JSON.parse(URI.open("#{url}").read)
  movie_hash = movies['results'][i]
  hash = { title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w300/#{movie_hash["poster_path"]}", rating: movie_hash['vote_average'] }
  Movie.create(hash)
  puts "#{i + 1} movie created"
end
20.times do |i|
  puts "importing #{i + 1} films from API"
  movies = JSON.parse(URI.open("#{url2}").read)
  movie_hash = movies['results'][i]
  hash = { title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w300/#{movie_hash["poster_path"]}", rating: movie_hash['vote_average'] }
  Movie.create(hash)
  puts "#{i + 1} movie created"
end
20.times do |i|
  puts "importing #{i + 1} films from API"
  movies = JSON.parse(URI.open("#{url3}").read)
  movie_hash = movies['results'][i]
  hash = { title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w300/#{movie_hash["poster_path"]}", rating: movie_hash['vote_average'] }
  Movie.create(hash)
  puts "#{i + 1} movie created"
end

puts 'Seeds completed'

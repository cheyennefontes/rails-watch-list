require 'open-uri'
require 'json'

# DELETES EXISTING RECORDS
print 'Deleting existing Bookmarks...'
Bookmark.destroy_all
puts ' ...deleted!'
print 'Deleting existing Movies...'
Movie.destroy_all
puts ' ...deleted!'
print 'Deleting existing Lists...'
List.destroy_all
puts ' ...deleted!'

print 'Get top rated movies from API...'
top_url = 'http://tmdb.lewagon.com/movie/top_rated'
top_serialized = URI.open(top_url).read
top_movies = JSON.parse(top_serialized)
puts '... received!'

print 'Creating top movies...'
top_movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average'].to_f

  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
puts ' ...created!'

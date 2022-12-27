require 'csv'


csv_text = File.read(Rails.root.join('lib', 'seeds', 'mymoviess.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  t = Movie.create!
  t.title = row['title']
  t.poster_url = row['poster_url-src']
  t.save
  puts "#{t.title}, #{t.poster_url} saved"
  #Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "There are now #{Movie.count} rows in the movies table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'mistery_movies.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  t = Movie.create!
  t.title = row['title']
  t.poster_url = row['poster_url-src']
  t.save
  puts "#{t.title}, #{t.poster_url} saved"
  #Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "There are now #{Movie.count} rows in the movies table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'drama_movies.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  t = Movie.create!
  t.title = row['title']
  t.poster_url = row['poster_url-src']
  t.save
  puts "#{t.title}, #{t.poster_url} saved"
  #Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "There are now #{Movie.count} rows in the movies table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'animation_movies.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  t = Movie.create!
  t.title = row['title']
  t.poster_url = row['poster_url-src']
  t.save
  puts "#{t.title}, #{t.poster_url} saved"
  #Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "There are now #{Movie.count} rows in the movies table"

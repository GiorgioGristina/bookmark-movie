# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

 hash = user['results'].first(10)

puts 'deleting movie'
Movie.destroy_all
puts 'database clean'

puts 'creating movie'

hash.each do |movie|

  movie = Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: movie["vote_average"],
    )

  puts "id: #{movie.id} movie: #{movie.title}"

end

puts 'finished to create movie'
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all
puts 'Uploading movies...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
url_open = URI.open(url).read
url_parse = JSON.parse(url_open)
results_hash = url_parse['results']

results_hash.each do |hash|
  movie = Movie.create(
    title: hash['original_title'],
    overview: hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{hash['poster_path']}",
    rating: hash['vote_average']
  )
end

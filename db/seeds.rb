# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning the db...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating 50 restaunrants...'
50.times do
  Restaurant.create!(
    name: "#{Faker::Hipster.word} #{Faker::Food.dish}",
    address: Faker::Games::SuperMario.location,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
end
puts "...created #{Restaurant.count} restaurants"

puts 'Creating 200 reviews...'
200.times do
  Review.create!(
    content: "#{Faker::TvShows::Friends.quote} #{Faker::TvShows::BigBangTheory.quote}",
    rating: (1..5).to_a.sample,
    restaurant: Restaurant.all.sample
  )
end
puts "...created #{Review.count} reviews"

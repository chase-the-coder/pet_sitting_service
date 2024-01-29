# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Destroying all bookings, users, animals'
Booking.destroy_all
User.destroy_all
Animal.destroy_all

puts 'Seeding DB with Bookings'

# Create 20 bookings
20.times do
  Booking.create(
    user_attributes: {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    },
    animal_attributes: {
      name: Faker::Creature::Dog.name,
      animal_type: %w[Dog Cat].sample
    },
    hours_requested: rand(2..8),
    date_of_service: Faker::Date.forward(days: 23)
  )
end

puts 'Created 20 bookings'

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create(email: "test@test.com", password: "123456")

test_trip = Trip.create(name: "A night in Philly", description: "a nutritional gauntlet", location: "Philly", start_time: Time.now, end_time: Time.now, duration: 4, cost: 40, user_id: test_user.id)

3.times do
  user = User.create(
    email: Faker::Internet.email,
    password: '123456',
    )
    2.times do
      Trip.create(
        name: Faker::Coffee.blend_name,
        description: Faker::RickAndMorty.quote,
        location: "Philly",
        start_time: Time.now,
        end_time: Time.now,
        duration: 4,
        cost: 40,
        user_id: user.id
      )
    end
    3.times do
      user.trips << Event.create(
        name: Faker::Coffee.blend_name,
        description: Faker::Coffee.notes,
        location: Faker::Space.planet,
        start_time: Time.now,
        end_time: Time.now,
        duration: 3,
        cost: 5,
        user_id: user.id
      )
    end
end

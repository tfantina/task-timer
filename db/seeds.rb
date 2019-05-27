# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker

5.times do
  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.first_name,
    password: Faker::Internet.password(8)
  )
end

10.times do
  Subproject.create!(
    name: Faker::Music.band,
    description: Faker::Hipster.sentence(3, true)
  )
end




8.times do
  Project.create!(
    name: Faker::Music.album,
    start: Faker::Date.backward(365),
    subproject_ids: Subproject.pluck(:id).sample(rand(3...8))
  )
end

10.times do 
  Task.create!(
    comments: Faker::Book,
    project_id: Faker::Number.between(0, 7),
    time: Faker::Number.between(15,420),
    day: Faker::Time.between(2.days.ago, Date.today, :day),
   subproject_id: Faker::Number.between(0,9),
     )
   end
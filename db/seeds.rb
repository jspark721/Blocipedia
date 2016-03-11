# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create fake users
20.times do
  User.create!(
    :name                   => Faker::Name.name,
    :email                  => Faker::Internet.email,
    :password               => "helloworld",
    :password_confirmation  => "helloworld"
  )
end

# Create fake wikis

15.times do
  Wiki.create!(
    :title          => Faker::Commerce.department,
    :body           => Faker::Lorem.paragraphs
  )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"

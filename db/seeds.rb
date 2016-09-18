# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do |n|
    email = Faker::Internet.email
    password = "password"
    User.create!(email: email,
                 password: password,
                 password_confirmation: password
    )
end


20.times do |n|
    Blog.create(title:  Faker::Name.title,
                content:   Faker::Hipster.sentence,
                user_id: Faker::Number.between(1, 20)
    )
end

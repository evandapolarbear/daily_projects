# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "bob")
User.create(email: "taco")
User.create(email: "coffee")
User.create(email: "matte")

ShortenedUrl.create(long_url: "google", short_url: "g", :user_id => 1)
ShortenedUrl.create(long_url: "google", short_url: "g2", :user_id => 2)
ShortenedUrl.create(long_url: "amazon", short_url: "a", :user_id => 1)

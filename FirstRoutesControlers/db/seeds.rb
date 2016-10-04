# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Alice', 'Bobby', 'Chris', 'Danny'].each do |name|
  User.create(username: name)
end

['Bozo', 'Pagliacci', 'Barnum', 'Harpo'].
zip(['bozo@creepyclown.net', 'bozo@creepyclown.net',
  'ptb@asuckerisborn.com', 'harpo@marx.com'],
  [1, 2, 1, 3]).each do |name, email, user_id|
  Contact.create(name: name, email: email, user_id: user_id)
end

ContactShare.create(user_id: 4, contact_id: 3)
ContactShare.create(user_id: 1, contact_id: 2)
ContactShare.create(user_id: 1, contact_id: 4)

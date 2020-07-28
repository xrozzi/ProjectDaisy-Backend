# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# forum type in user email
# create a conversation, once conversation created then messages can be sent 


User.create(:email => 'admin@projectdaisy.com.au', :password => 'secretpassword')
User.create(:email => 'admin1@projectdaisy.com.au', :password => 'secretpassword')








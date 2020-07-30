# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# forum type in user email
# create a conversation, once conversation created then messages can be sent 

#Create users to populate the databse
User.create(:email => 'rose@projectdaisy.com.au', :password => 'secretpassword', :firstname => 'Rose', :lastname => 'Hernandez')
User.create(:email => 'esther@projectdaisy.com.au', :password => 'secretpassword', :firstname => 'Esther', :lastname => 'Csoke')
User.create(:email => 'nikki@projectdaisy.com.au', :password => 'secretpassword', :firstname => 'Nikki', :lastname => 'Waelkens')








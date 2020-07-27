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



categories = [
  { name: "Ruby"},
  { name: "Python"},
  { name: "JavaScript"},  
  { name: "HTML/CSS"},
  { name: "C++"},
  { name: "React/MERN"},
  { name: "Workplace Advice"},
  { name: "Career Progression"},
  { name: "For Fun/AmA"},
  { name: "Show off your work"},
]

categories.each do |category|
    Category.create(category)
  end




Forum.create(:title => "Category 5 post", discussion: "hihihi", user_id: 1, category_id: 5)
Forum.create(:title => "Category 2 post", discussion: "hihihi", user_id: 2, category_id: 2)
Forum.create(:title => "Category 9 post", discussion: "hellooooooooo", user_id: 2, category_id: 9)
Forum.create(:title => "Category 9 post", discussion: "helllooooo", user_id: 2, category_id: 9)

Comment.create(:body => "yeahhh i know so cool,", user_id: 1, forum_id: 9)
Comment.create(:body => "yeahhh i know so cool,", user_id: 2, forum_id: 9)
Comment.create(:body => "yeahhh i know so cool,", user_id: 1, forum_id: 2)






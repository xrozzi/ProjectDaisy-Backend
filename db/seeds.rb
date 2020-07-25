# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# forum type in user email
# create a conversation, once conversation created then messages can be sent 


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

# user1 = User.create(username: "trollerz", email: "lolerskatez@me.com", password: "iLoVeC4Mp1nG")


# post1 = user3.forums.build(title: "Coding is funnn", discussion: "wondering if anyone feels the same?", category: 5, user_id: 1)
# post1.save




Forum.create(:title => "hellooooo", discussion: "hihihi", user_id: 1, category_id: 5)
Forum.create(:title => "AMA", discussion: "Hi my name is Grimes, I am elons musks gf, ask me anything", user_id: 2, category_id: 9)

Forum.create(:title => "AMA", discussion: "Hi my name is Grimes, I am elons musks gf, ask me anything", user_id: 2, category_id: 9)


Comment.create(:body => "yeahhh i know so cool, y did you date him", user_id: 2, forum_id: 1)






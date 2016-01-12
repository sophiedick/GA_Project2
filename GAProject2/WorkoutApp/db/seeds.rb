# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Starting seed.....'

# create users
user1 = User.create(username:"Sophie", email:"sophie@sophie.com", password: "sophie", password_confirmation: "sophie")
user2 = User.create(username:"Charlie", email:"charlie@charlie.com", password: "sophie", password_confirmation: "sophie")

#create a workout for each user
w1 = user1.workouts.create()
w2 = user2.workouts.create()

#add some new exercises to workout1
e1 = w1.exercises.create(bodypart:"Arms", content:"10 x tricep dips", comments:"For a very arms light day", creator: user1.id)
e2 = w1.exercises.create(bodypart:"penis", content:"10 x penis dips", comments:"For a very penis light day", creator: user1.id)
e3 = w1.exercises.create(bodypart:"face", content:"10 x face dips", comments:"For a very face light day", creator: user2.id)

#add some new exercises to workout2
e4 = w2.exercises.create(bodypart:"test1", content:"TESTdips", comments:"dffgfdsght day", creator: user1.id)
e5 = w2.exercises.create(bodypart:"test2", content:"TESTpenis dips", comments:"For a very fdgsfdgght day", creator: user1.id)
e6 = w2.exercises.create(bodypart:"test3", content:"TESTface dips", comments:"For a verydsfgdfgight day", creator: user2.id)

#add an existing exercise to an existing workout
w1.exercises << e4 #(this exercise was created by user2 and now adding it to one of user1's workouts)
w1.exercises << e6 #(this exercise was created by user2 and now adding it to one of user1's workouts)
w2.exercises << e1 #(this exercise was created by user1 and now adding it to one of user2's workouts)
w2.exercises << e2 #(this exercise was created by user1 and now adding it to one of user2's workouts)

puts 'Seeded.'


# test commands:
  # u1 = User.first
  # u2 = User.last

  # u1.workouts           > returns all the workouts associated with u1
  # u1.exercises          > returns all the exercises associated with u1
  # u2.workouts           > returns all the workouts associated with u2
  # u2.exercises          > returns all the exercises associated with u2

  # e1 = Exercise.first
  # e1.users              > returns all the users that have e1 within their workouts


# 

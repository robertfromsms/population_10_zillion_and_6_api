# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
	User.create(
		user_name: Faker::Name.name.split(" ").join("").downcase + rand(0..1000).to_s,
		password: "1234"
	)
end

Activity.create(
		description: "Go to a concert with local artists with some friends",
  		accessibility: 0.3,
  		category: "social",
  		participants: 3,
  		price: 0.4,
  		apiKey: 2211716
	)

Activity.create(
		description: "Clean out your car",
  		accessibility: 0.08,
  		category: "recreational",
  		participants: 1,
  		price: 0,
  		apiKey: 2896176
	)

Activity.create(
		description: "Watch a movie you'd never usually watch",
  		accessibility: 0.15,
  		category: "relaxation",
  		participants: 1,
  		price: 0.15,
  		apiKey: 9212950
	)

Activity.create(
		description: "Paint the first thing you see",
		accessibility: 0.2,
		category: "recreational",
		participants: 1,
		price: 0.25,
		apiKey: 1162360
	)

Activity.create(
		description: "Learn how to use a french press",
		accessibility: 0.3,
		category: "recreational",
		participants: 1,
		price: 0.3,
		apiKey: 4522866
	)

Activity.create(
		description: "Go swimming with a friend",
		accessibility: 0.1,
		category: "social",
		participants: 2,
		price: 0.1,
		apiKey: 1505028
)

Activity.create(
		description: "Try a food you don't like",
		accessibility: 0.05,
		category: "recreational",
		participants: 1,
		price: 0.1,
		apiKey: 6693574
	)

50.times do
	Comment.create(user_id: rand(0..19), activity_id: rand(0..6), content: Faker::ChuckNorris.fact)
end

50.times do
	ActivityInstance.create(user_id: rand(0..19), activity_id: rand(0..6), rating: rand(0..5), completed: Faker::Boolean.boolean)
end
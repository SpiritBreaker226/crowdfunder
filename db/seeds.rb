# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reward.destroy_all
Pledge.destroy_all
Campaign.destroy_all
User.destroy_all

4.times do
	user = User.create!({
		email: Faker::Internet.safe_email(),
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: "password",
		password_confirmation: "password"
	})

	25.times do
		camp = Campaign.create!({
			title: Faker::Company.name,
			description: Faker::Company.bs << " " << Faker::Company.catch_phrase,
			funding_goal: Faker::Number.number(6),
			start_date: Date.today, 
			end_date: Faker::Date.between(25.days.from_now, 50.days.from_now),
			user_id: user.id
		})
	end
end
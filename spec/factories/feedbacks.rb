require 'faker'

FactoryGirl.define do
  factory :feedback do
		name Faker::Name.name
		email Faker::Internet.email 
		description Faker::Lorem.paragraph
	end
end

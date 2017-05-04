require 'faker'

FactoryGirl.define do
	factory :post do 
		title { Faker::Book.unique.title + ((1..1000).to_a).sample.to_s }
		body Faker::Lorem.paragraph
		category
	end
end

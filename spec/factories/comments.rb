require 'faker'

FactoryGirl.define do
	factory :comment do
		commentor_name { Faker::Name.unique.name + ((1..1000).to_a).sample.to_s }
		commentor_account Faker::Internet.email
		content Faker::Lorem.paragraph
		post
	end
end

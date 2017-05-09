require 'faker'

FactoryGirl.define do
	factory :user do
		email { Faker::Internet.unique.email + ((1..1000).to_a).sample.to_s }
		password 'password'
		password_confirmation 'password'
	end
end

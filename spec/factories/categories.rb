require 'faker'

FactoryGirl.define do 
	factory :category do 
		name { Faker::Team.unique.name + ((1..1000).to_a).sample.to_s }
	end
end

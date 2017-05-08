require 'rails_helper'

feature 'user submit feedback' do
	scenario 'with valid feedback info' do
		visit '/'
		fill_in "Email", with: "fbemail@example.com"
		fill_in "Name", with: "peter"
		fill_in "Describe what you want to communicate with me!", with: "I want to make friends with you"
		click_on "LET'S TALK"

		expect(page).to have_content("Thanks for your feedback, I will contact you as soon as possible.")
	end
end

require 'rails_helper'

feature 'user sign in' do
	scenario 'with valid credentials' do
		user = FactoryGirl.create(:admin_user, email: "admin@example.com", password: "password", password_confirmation: "password")
		visit '/admin/login'
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_on 'Login'

		expect(page).to have_content("Signed in successfully")
	end
end

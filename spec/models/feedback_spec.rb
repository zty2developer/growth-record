require 'rails_helper'

describe Feedback do
  it 'has a valid factory' do
		expect(FactoryGirl.create(:feedback)).to be_valid
	end

	it 'invaild without name' do
		expect(FactoryGirl.build(:feedback, name: nil)).to be_invalid
	end

	it 'invaild without email' do
		expect(FactoryGirl.build(:feedback, email: nil)).to be_invalid
	end

	it 'invaild without post' do
		expect(FactoryGirl.build(:feedback, description: nil)).to be_invalid
	end
end

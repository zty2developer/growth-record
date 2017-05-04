require 'rails_helper'

describe Comment do
  it 'has a valid factory' do
		expect(FactoryGirl.create(:comment)).to be_valid
	end

	it 'invaild without commentor name' do
		expect(FactoryGirl.build(:comment, commentor_name: nil)).to be_invalid
	end

	it 'invaild without content' do
		expect(FactoryGirl.build(:comment, content: nil)).to be_invalid
	end

	it 'invaild without post' do
		expect(FactoryGirl.build(:comment, post: nil)).to be_invalid
	end
end

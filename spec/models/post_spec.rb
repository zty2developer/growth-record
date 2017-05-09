require 'rails_helper'

describe Post do
	it 'has a valid factory' do
		expect(FactoryGirl.create(:post)).to be_valid
	end

	it 'invalid without a title' do
		expect(FactoryGirl.build(:post, title: nil)).to be_invalid
	end

	it 'invalid without a body' do
		expect(FactoryGirl.build(:post, body: nil)).to be_invalid
	end
	
	it 'invalid if title is not uniqueness' do
		post = FactoryGirl.create(:post)
		expect(FactoryGirl.build(:post, title: post.title)).to be_invalid
	end

end


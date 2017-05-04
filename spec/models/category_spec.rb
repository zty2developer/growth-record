require 'rails_helper'

describe Category do
  it 'has a valid factory' do
		expect(FactoryGirl.create(:category)).to be_valid
	end	

	it 'invalid without a name' do
		expect(FactoryGirl.build(:category, name: nil)).to be_invalid
	end

	it 'invalid if name is not unique' do
		category = FactoryGirl.create(:category)
		expect(FactoryGirl.build(:category, name: category.name)).to be_invalid
	end

end

require 'rails_helper'

RSpec.describe FeedbacksController, :type => :controller do
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'create the feedback' do
				post :create, feedback: attributes_for(:feedback)
				expect(Feedback.count).to eq(1)
			end

			it 'redirect to home page after successfully created feedback' do
				post :create, feedback: attributes_for(:feedback)
				expect(response).to redirect_to root_path
			end
		end

		context 'with invalid attributes' do
			it 'can not create the feedback' do
				 post :create, feedback: attributes_for(:feedback, name: nil)
				 expect(Feedback.count).to eq(0)
			end
      
			it 'redirect to home page after failed to create feedback' do
				post :create, feedback: attributes_for(:feedback, name: nil)
				expect(response).to redirect_to root_path
			end
		end
	end
end

require 'rails_helper'

RSpec.describe BlogsController, :type => :controller do
	describe 'GET #index' do
		it 'response successfully with an HTTP 200 status code' do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it 'renders the index template' do
			get :index
			expect(response).to render_template(:index)
		end
		
	  it 'loads all of the categories and posts' do
			category1 = FactoryGirl.create(:category)
			post1 = FactoryGirl.create(:post, category_id: category1.id)

			get :index
			expect(assigns(:posts)).to eq([post1])
			expect(assigns(:categories)).to eq([category1])
		end	
	end

	# describe 'GET #category' do
	# 	it 're-render template post_list' do
	# 		category1 = FactoryGirl.create(:category)
	# 		get :category, category_id: category1.id
  #
	# 		expect(response).to render_template(:post_list)
	# 	end
	# end
end

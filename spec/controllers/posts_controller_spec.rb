require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
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

		it 'loads all of the posts into @posts' do
			post1 = FactoryGirl.create(:post)
			post2 = FactoryGirl.create(:post)

			get :index
			expect(assigns(:posts)).to eq([post1, post2])
		end
	end

	describe 'POST #create' do
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			sign_in FactoryGirl.create(:user) # Using factory girl as an example
		end

		context 'with valid attributes' do
			it 'create the post' do
				post :create, post: FactoryGirl.build(:post).attributes
				expect(Post.count).to eq(1)
			end

			it 'redirect to index action after successfully created post' do
				post :create, post: FactoryGirl.build(:post).attributes
				expect(response).to redirect_to posts_path
			end
		end

		context 'with valid attributes' do
			it 'does not successfully save the post' do
				post :create, post: attributes_for(:post, title: nil, category_id: FactoryGirl.create(:category).id)
				expect(Post.count).to eq(0)
			end

			it 're-render the new view' do
				post :create, post: attributes_for(:post, title: nil, category_id: FactoryGirl.create(:category).id)
				expect(response).to render_template :new
			end
		end
	end

	describe 'PUT #update' do
		before(:each) do
			@post = FactoryGirl.create(:post)
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			sign_in FactoryGirl.create(:user) # Using factory girl as an example
		end

		context 'valid attributes' do
			it 'located the requestes @post' do
				put :update, id: @post, post: attributes_for(:post, category_id: FactoryGirl.create(:category).id)
				expect(assigns(:post)).to eq(@post)
			end

			it "changes @post's attributes" do
				put :update, id: @post, post: attributes_for(:post, title: "changed title", body: "changed body")
				@post.reload
				expect(@post.title).to eq "changed title"
				expect(@post.body).to eq "changed body"
			end

			it "redirect to posts index page" do
				put :update, id: @post, post: attributes_for(:post, title: "changed title", body: "changed body")
				expect(response).to redirect_to posts_path
			end
		end

		context 'invalid attributes' do
			it 'located the requestes @post' do
				put :update, id: @post, post: attributes_for(:post, cateogory_id: FactoryGirl.create(:category).id)
				expect(assigns(:post)).to eq(@post)
			end

			it "does not changes @post's attributes" do
				put :update, id: @post, post: attributes_for(:post, title: nil, body: "changed body")
				@post.reload
				expect(@post.title).not_to eq "changed title"
				expect(@post.body).not_to eq "changed body"
			end

			it "re-render posts edit page" do
				put :update, id: @post, post: attributes_for(:post, title: nil, body: "changed body")
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #delete' do
		before(:each) do
			@post = FactoryGirl.create(:post)
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			sign_in FactoryGirl.create(:user) # Using factory girl as an example
		end

		it 'deletes the post' do
			expect {
				delete :destroy, id: @post
			}.to change(Post, :count).by(-1)
		end

		it 'redirect to index page after deleted' do
			delete :destroy, id: @post
			expect(response).to redirect_to posts_path
		end
	end
end

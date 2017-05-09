ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:title, :summary, :body, :category_id]
		# permitted << :other if params[:action] == 'create' && current_user.admin?
		permitted
	end

	actions :all, except: [:show]
	menu label: "Posts", priority: 1

	# configure index section
	index do
    selectable_column
		column :title
		column :summary do |post|
			post.summary.truncate(300)
		end
		column "Released", :created_at
		column :category
		actions
	end

	form do |f|
		inputs 'Details', id: "custom_post_detail" do
			li "Created at #{f.object.created_at}" unless f.object.new_record?
			input :category
			input :title
			input :summary, input_html: { rows: 10 }
			input :body, label: "Post Content", input_html: { id: "text-input", rows: 30, oninput: "this.editor.update()"}
		end
		div id: "preview" do
		end

		para "Press cancel to return to the list without saving."
		actions
	end

end

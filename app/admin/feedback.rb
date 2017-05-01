ActiveAdmin.register Feedback do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:name, :email, :description]
		# permitted << :other if params[:action] == 'create' && current_user.admin?
		permitted
	end

	actions :all, except: [:show]
	menu label: "Feedbacks", priority: 3

	index do
    selectable_column
		column :name
		column :email
		column :description do |feedback|
			feedback.description.truncate(200)			
		end
		column "Received At", :created_at
		actions 
	end
end

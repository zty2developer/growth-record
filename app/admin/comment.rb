ActiveAdmin.register Comment do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:commentor_name, :commentor_account, :content]
		# permitted << :other if params[:action] == 'create' && current_user.admin?
		permitted
	end

	menu label: "Comments", priority: 5
	actions :all, except: [:show]

	index do
		selectable_column
		column :commentor_name
		column :commentor_account
		column :content
		column "Commented At", :created_at
	end

end

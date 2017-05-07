ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:name, :background]
		# permitted << :other if params[:action] == 'create' && current_user.admin?
		permitted
	end

	actions :all, except: [:show]
	menu label: "Categories", priority: 2
	
	index do
    selectable_column
		column :name
		column :created_at

		column "Background Image", :background do |category|
			div class: "category-background" do
				image_tag category.background_url
			end
		end
		actions
	end

end

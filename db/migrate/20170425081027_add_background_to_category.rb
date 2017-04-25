class AddBackgroundToCategory < ActiveRecord::Migration[5.0]
  def change
		add_column :categories, :background, :string
  end
end

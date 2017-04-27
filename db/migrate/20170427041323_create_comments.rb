class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
			t.string :commentor_name, default: "guest", null: false
			t.string :commentor_account
			t.text :content, null: false

      t.timestamps
    end
  end
end

class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :full_name, :string
  	add_column :users, :phone, :string
  	add_column :users, :role_id, :integer 
  end
end

class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name
      t.string :description
      t.integer :interest_level

      t.timestamps null: false
    end
  end
end

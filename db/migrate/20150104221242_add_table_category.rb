class AddTableCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_type_id
    end
    add_index(:categories, [:category_type_id, :name], unique: true)
  end
end

class AddTableCategoryType < ActiveRecord::Migration
  def change
    create_table :category_types do |t|
      t.string :name
      t.integer :main_category_id
    end
    add_index(:category_types, [:main_category_id, :name], unique: true)
  end
end

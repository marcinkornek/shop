class AddImageToMainCategories < ActiveRecord::Migration
  def change
    add_column :main_categories, :image, :string
  end
end

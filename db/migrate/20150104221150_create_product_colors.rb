class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.string :color
      t.string :image
      t.integer :product_id

      t.timestamps
    end
  end
end

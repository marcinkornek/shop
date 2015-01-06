class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.string :size
      t.string :quantity
      t.integer :product_color_id

      t.timestamps
    end
  end
end

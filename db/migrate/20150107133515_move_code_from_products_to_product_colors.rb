class MoveCodeFromProductsToProductColors < ActiveRecord::Migration
  def change
    remove_column :products, :code, :string
    add_column :product_colors, :code, :string, null: false
  end
end

class RemoveImagesFromProductsAddImagesToProductColors < ActiveRecord::Migration
  def change
    remove_column :products, :images, :json
    add_column :product_colors, :images, :json
  end
end

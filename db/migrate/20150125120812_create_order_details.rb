class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.decimal :price
      t.integer :amount
      t.integer :product_size_id
      t.integer :order_id

      t.timestamps
    end
  end
end

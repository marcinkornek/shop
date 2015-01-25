class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end

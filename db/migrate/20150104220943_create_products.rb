class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :code, null: false
      t.decimal :price
      t.string :composition
      t.json :images
      t.integer :category_id

      t.timestamps
    end
    add_index(:products, :code, unique: true)
  end
end

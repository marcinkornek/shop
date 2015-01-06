class AddTableMainCategory < ActiveRecord::Migration
  def change
    create_table :main_categories do |t|
      t.string :name
    end
    add_index(:main_categories, :name, unique: true)
  end
end

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :tel_num
      t.string :street
      t.string :house_num
      t.string :town
      t.string :postcode
      t.integer :user_id

      t.timestamps
    end
  end
end

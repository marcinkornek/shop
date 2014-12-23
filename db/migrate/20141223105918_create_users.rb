class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :tel_num
      t.date   :birth_date
      t.string :role,       default: "user"
      t.text   :uid
      t.string :provider

      t.timestamps
    end
  end
end

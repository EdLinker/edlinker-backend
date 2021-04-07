class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :phone_number
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.index  :email, unique: true

      t.timestamps
    end
  end
end

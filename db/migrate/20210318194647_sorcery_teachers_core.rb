class SorceryTeachersCore < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :crypted_password, :string
    add_column :teachers, :salt, :string

    add_index :teachers, :email, unique: true
  end
end

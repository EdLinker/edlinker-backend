class SorceryStudentsCore < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :crypted_password, :string
    add_column :students, :salt, :string

    add_index  :students, :email, unique: true
  end
end

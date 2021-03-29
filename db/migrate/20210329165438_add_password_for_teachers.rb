class AddPasswordForTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :password, :string
  end
end

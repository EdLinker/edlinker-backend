class AddPasswordForStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :password, :string
  end
end

class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :phone_number
      t.string :email
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :tuition_form
      t.integer :course_number
      t.timestamps
    end
  end
end

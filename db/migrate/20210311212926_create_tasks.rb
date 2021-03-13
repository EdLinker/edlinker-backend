class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :student_id
      t.string  :description
      t.string  :link
      t.string  :status
      t.timestamps
    end
  end
end

class FixTaskAssotiations < ActiveRecord::Migration[6.0]
  def up
    remove_column :tasks, :student_id
    add_belongs_to :tasks, :student, foreign_key: true
  end
  def down
    change_column :tasks, :student_id, :integer
  end
end

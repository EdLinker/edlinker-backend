class FixMessageAssotiations < ActiveRecord::Migration[6.0]
  def up
    remove_column :messages, :task_id
    add_belongs_to :messages, :task, foreign_key: true
  end
  def down
    change_column :messages, :task_id, :integer
  end
end

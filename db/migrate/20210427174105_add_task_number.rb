class AddTaskNumber < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :number, :integer
  end
end

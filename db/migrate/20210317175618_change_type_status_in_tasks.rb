class ChangeTypeStatusInTasks < ActiveRecord::Migration[6.0]
  def up
    remove_column :tasks, :status
    add_column :tasks, :status, :integer, null: false, default: 0
  end

  def down
    change_column :tasks, :status, :string
  end
end

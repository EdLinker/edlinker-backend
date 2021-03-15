class RenameColumnInGroups < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :students_id, :group_leader_id
  end
end

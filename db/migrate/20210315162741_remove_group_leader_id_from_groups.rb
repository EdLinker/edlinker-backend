class RemoveGroupLeaderIdFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :group_leader_id, :integer
  end
end

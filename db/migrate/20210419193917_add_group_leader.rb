class AddGroupLeader < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :group_leader_id, :bigint, foreign_key: true
  end
end

class AddGroupLeader < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :group_leader, :string, foreign_key: true
  end
end

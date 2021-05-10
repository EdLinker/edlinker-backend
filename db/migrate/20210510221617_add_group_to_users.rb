class AddGroupToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :group_id, :bigint
    remove_column :groups, :user_id
  end
end

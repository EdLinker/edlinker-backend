class AddGroupIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :user_id, :bigint
  end
end

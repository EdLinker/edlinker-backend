class AddUserIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :user_id, :bigint
  end
end

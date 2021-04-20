class AddGroupIdUserIdToAuditorium < ActiveRecord::Migration[6.0]
  def change
    add_column :auditoriums, :group_id, :bigint
    add_column :auditoriums, :user_id, :bigint
  end
end

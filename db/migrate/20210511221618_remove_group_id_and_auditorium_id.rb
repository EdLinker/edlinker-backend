class RemoveGroupIdAndAuditoriumId < ActiveRecord::Migration[6.0]
  def change
    remove_column :auditoriums, :group_id, :bigint
    remove_column :groups, :auditorium_id, :bigint
  end
end

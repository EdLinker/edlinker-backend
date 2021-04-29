class AddAuditoriumIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :auditorium_id, :bigint
  end
end

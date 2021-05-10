class AddAuthorIdToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :author_id, :bigint
  end
end

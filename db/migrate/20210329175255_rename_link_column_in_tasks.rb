class RenameLinkColumnInTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :link, :url
  end
end

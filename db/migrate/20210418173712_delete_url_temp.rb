class DeleteUrlTemp < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :url_temp
  end
end

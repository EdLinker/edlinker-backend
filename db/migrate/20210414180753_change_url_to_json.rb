class ChangeUrlToJson < ActiveRecord::Migration[6.0]
  def up
    remove_column :tasks, :url
    add_column :tasks, :url, :jsonb, using: 'to_jsonb(url)'
  end

  def down
    change_column :tasks, :url, :string, array: true, default: []
  end
end

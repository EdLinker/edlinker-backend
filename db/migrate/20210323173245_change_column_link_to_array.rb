class ChangeColumnLinkToArray < ActiveRecord::Migration[6.0]
  def up
    change_column :tasks, :link, :string, array: true, default: [], using: "(string_to_array(link, ','))"
    change_column :messages, :link, :string, array: true, default: [], using: "(string_to_array(link, ','))"
  end
  def down
    change_column :tasks, :link, :string
    change_column :messages, :link, :string
  end
end

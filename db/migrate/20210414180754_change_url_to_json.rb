class ChangeUrlToJson < ActiveRecord::Migration[6.0]
  def change
    rename_column(:tasks, :url, :url_temp)
    add_column(:tasks, :url, :jsonb, default: {})
  end
end



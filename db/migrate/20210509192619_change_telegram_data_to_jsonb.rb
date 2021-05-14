class ChangeTelegramDataToJsonb < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :telegram_data, :jsonb
  end

  def down
    change_column :users, :telegram_data, :json
  end
end

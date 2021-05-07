class AddTelegramDataForUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telegram_data, :json
  end
end

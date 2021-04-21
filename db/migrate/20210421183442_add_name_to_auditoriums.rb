class AddNameToAuditoriums < ActiveRecord::Migration[6.0]
  def change
    add_column :auditoriums, :name, :string
  end
end

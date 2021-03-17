class DropAuditoriaTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :auditoria
  end
end

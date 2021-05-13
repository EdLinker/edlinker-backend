class CreateLocationJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.bigint :auditorium_id, index: true
      t.bigint :group_id, index: true

      t.timestamps
    end
  end
end

class CreateAuditoriums < ActiveRecord::Migration[6.0]
  def change
    create_table :auditoriums do |t|

      t.timestamps
    end
  end
end

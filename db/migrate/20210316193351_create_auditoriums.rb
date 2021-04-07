class CreateAuditoriums < ActiveRecord::Migration[6.0]
  def change
    create_table :auditoriums do |t|
      t.belongs_to :teacher, foreign_key: true


      t.timestamps
    end
  end
end

class CreateAuditoriums < ActiveRecord::Migration[6.0]
  def change
    create_table :auditoria do |t|
      t.belongs_to :group, foreign_key: true
      t.belongs_to :subject, foreign_key: true
      t.belongs_to :teacher, foreign_key: true

      t.timestamps
    end
  end
end

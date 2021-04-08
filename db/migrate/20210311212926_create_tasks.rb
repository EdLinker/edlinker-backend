class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, foreign_key: true
      t.string  :description
      t.string  :url, array: true, default: []
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end

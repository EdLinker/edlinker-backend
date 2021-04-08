class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.belongs_to :task, foreign_key: true
      t.text       :body
      t.string     :url, array: true, default: []
      t.integer    :status, default: 0
      t.references :author, polymorphic: true
      t.timestamps
    end
  end
end

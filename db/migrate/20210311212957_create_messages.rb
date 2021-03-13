class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :task_id
      t.string  :author_type
      t.text    :body
      t.string  :link
      t.timestamps
    end
  end
end
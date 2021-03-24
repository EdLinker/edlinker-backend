class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer    :task_id
      t.text       :body
      t.string     :link
      t.references :author, polymorphic: true
      t.timestamps
    end
  end
end

class CreateGroupsStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_students do |t|
      t.belongs_to :group, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true
      t.string :group_leader

      t.timestamps
    end
  end
end

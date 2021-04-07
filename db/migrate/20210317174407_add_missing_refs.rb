class AddMissingRefs < ActiveRecord::Migration[6.0]
  def change
    add_reference :subjects, :auditorium, foreign_key: true
    add_reference :groups, :auditorium, foreign_key: true

  end
end

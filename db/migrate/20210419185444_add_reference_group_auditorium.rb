class AddReferenceGroupAuditorium < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :auditorium, foreign_key: true
  end
end

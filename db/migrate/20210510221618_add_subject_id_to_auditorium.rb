class AddSubjectIdToAuditorium < ActiveRecord::Migration[6.0]
  def change
    add_column :auditoriums, :subject_id, :bigint
  end
end

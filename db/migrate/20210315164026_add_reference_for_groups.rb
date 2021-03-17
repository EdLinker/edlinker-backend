class AddReferenceForGroups < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :groups, :students, foreign_key: true
  end
end

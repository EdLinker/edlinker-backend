class AddGroupLeaderNameSurname < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :group_leader_name, :string
    add_column :groups, :group_leader_surname, :string
  end
end

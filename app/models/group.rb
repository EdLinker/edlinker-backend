class Group < ApplicationRecord
  belongs_to :auditorium
  belongs_to :user
  has_one :leader, class_name: "User", foreign_key: "group_leader_id"
  has_one :subject, through: :auditorium
end

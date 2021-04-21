class Group < ApplicationRecord
  has_many :users, through: :auditorium
  has_one :leader, class_name: "User", foreign_key: "group_leader_id"
  has_one :auditorium
  has_one :subject, through: :auditorium
end

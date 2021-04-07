class Group < ApplicationRecord
  has_many :users
  has_one :leader, class_name: "User", foreign_key: "group_leader_id"
  belongs_to :auditorium
  has_one :subject, through: :auditorium
end

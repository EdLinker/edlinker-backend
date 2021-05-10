class Group < ApplicationRecord
  belongs_to :auditorium
  has_many :users
  has_one :leader, class_name: "User", foreign_key: "group_leader_id"
  has_one :teacher, class_name: "User", foreign_key: "teacher_id"
  has_one :subject, through: :auditorium
end

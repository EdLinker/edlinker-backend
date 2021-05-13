class Group < ApplicationRecord
  has_many :locations
  has_many :auditoriums, through: :locations
  has_many :users
  has_one :leader, class_name: "User", foreign_key: "group_leader_id"
  has_one :teacher, class_name: "User", foreign_key: "teacher_id"
end

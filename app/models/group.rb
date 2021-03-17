class Group < ApplicationRecord
  has_many :students
  has_one :leader, class_name: "Student", foreign_key: "group_leader_id"
  belongs_to :auditorium
  has_one :subject, through: :auditorium


end

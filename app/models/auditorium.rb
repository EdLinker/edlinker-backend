class Auditorium < ApplicationRecord
  has_one :subject
  has_one :group
  has_many :students, through: :group
  has_many :tasks, through: :students
  belongs_to :teacher
end

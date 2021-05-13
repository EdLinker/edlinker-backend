class Auditorium < ApplicationRecord
  has_one  :subject
  has_many :locations
  has_many :groups, through: :locations
  belongs_to :user
  has_many :tasks
end

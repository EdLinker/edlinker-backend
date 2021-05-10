class Auditorium < ApplicationRecord
  has_one  :subject
  has_many :groups
  has_many :users, through: :groups
  has_many :tasks
end

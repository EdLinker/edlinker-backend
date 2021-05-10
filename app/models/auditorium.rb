class Auditorium < ApplicationRecord
  has_one  :subject
  has_many :groups
  belongs_to :user
  has_many :tasks
end

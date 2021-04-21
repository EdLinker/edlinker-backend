class Auditorium < ApplicationRecord
  has_one :subject
  belongs_to :group
  belongs_to :user
  has_many :tasks, through: :user
end

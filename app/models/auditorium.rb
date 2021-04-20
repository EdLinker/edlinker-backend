class Auditorium < ApplicationRecord
  has_one :subject
  has_one :group
  belongs_to :user
  has_many :tasks, through: :users
end

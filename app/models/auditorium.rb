class Auditorium < ApplicationRecord
  has_one :subject
  # has_one :group
  # has_many :users, through: :group
  # has_many :tasks, through: :users
  # belongs_to :user
end

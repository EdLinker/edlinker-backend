class Task < ApplicationRecord
  has_many   :messages
  has_one    :user
  belongs_to :auditorium
  belongs_to :subject

  validates  :title, presence: true

  STATUSES = %i[todo in_progress done].freeze
  enum status: STATUSES
end

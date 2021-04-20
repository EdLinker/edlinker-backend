class Task < ApplicationRecord
  has_many   :messages
  belongs_to :user
  belongs_to :subject

  validates  :title, presence: true

  STATUSES = %i[todo in_progress done].freeze
  enum status: STATUSES
end

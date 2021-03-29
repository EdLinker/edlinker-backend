class Task < ApplicationRecord
  has_many   :messages
  belongs_to :student

  STATUSES = %i[todo in_progress done].freeze
  enum status: STATUSES
end

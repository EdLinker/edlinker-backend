class Task < ApplicationRecord
  has_many   :messages
  belongs_to :user

  STATUSES = %i[todo in_progress done].freeze
  enum status: STATUSES
end

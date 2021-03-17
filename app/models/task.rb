class Task < ApplicationRecord
  has_many   :messages
  belongs_to :student

  enum status: [:new, :in_progress, :done]
end

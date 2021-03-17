class Task < ApplicationRecord
  has_many   :messages
  belongs_to :student

  enum status %i[NEW IN_PROGRESS DONE]
end

class Task < ApplicationRecord
  has_many   :messages
  belongs_to :student
end

class Subject < ApplicationRecord
  has_one   :auditorium
  has_many  :tasks
  validates :name, presence: true
end

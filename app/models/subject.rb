class Subject < ApplicationRecord
  belongs_to :auditorium
  has_many :tasks
  validates :name, presence: true
end

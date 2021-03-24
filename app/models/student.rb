class Student < ApplicationRecord
  belongs_to :group
  has_many :messages, as: :author
  has_many :tasks
end

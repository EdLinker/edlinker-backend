class Student < ApplicationRecord
  include ShowParams
  authenticates_with_sorcery!
  belongs_to :group
  has_many :messages, as: :author
  has_many :tasks
end

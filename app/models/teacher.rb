class Teacher < ApplicationRecord
  authenticates_with_sorcery!
  has_many :auditoriums
  has_many :groups, through: :auditoriums
  has_many :messages, as: :author
end

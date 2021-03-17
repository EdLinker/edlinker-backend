class Teacher < ApplicationRecord
  has_many :auditoriums
  has_many :groups, through: :auditoriums
  has_many :messages, as: :author
end

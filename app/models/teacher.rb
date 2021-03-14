class Teacher < ApplicationRecord
  has_many :auditoriums
  has_many :groups, through: :auditoriums
end

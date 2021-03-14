class Group < ApplicationRecord
  has_many :students
  has_many :auditoriums
  has_many :subjects, through: :auditoriums

end

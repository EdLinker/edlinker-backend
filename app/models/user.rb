class User < ApplicationRecord
  authenticates_with_sorcery!
  rolify
  #belongs_to :group
  # has_many :auditoriums
  # has_many :groups, through: :auditoriums
  # has_many :messages, as: :author
  # has_many :tasks
  enum role: [:admin, :student, :teacher]
end

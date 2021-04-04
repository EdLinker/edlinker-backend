class User < ApplicationRecord
  authenticates_with_sorcery!
  rolify
  after_create :assign_default_role
  
  belongs_to :group, optional: true
  has_many :auditoriums
  has_many :groups, through: :auditoriums
  has_many :messages, as: :author
  has_many :tasks

  private

  def assign_default_role
    add_role(:student) if self.roles.blank?
  end
end

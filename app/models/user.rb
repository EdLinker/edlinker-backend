class User < ApplicationRecord
  authenticates_with_sorcery!
  rolify
  after_create :assign_default_role

  belongs_to :group, optional: true
  has_many :auditoriums
  has_many :groups, through: :auditoriums
  has_many :messages, as: :author
  has_many :tasks

  accepts_nested_attributes_for :roles

  private

  def assign_default_role
    add_role(:student) if roles.blank?
  end
end

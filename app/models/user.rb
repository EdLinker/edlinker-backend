class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :confirmable, :validatable
  authenticates_with_sorcery!
  rolify
  mount_uploader :avatar, AvatarUploader

  validate  :must_have_a_role
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  has_many :auditoriums
  has_many :groups, through: :auditoriums
  has_many :messages, as: :author
  has_many :tasks

  accepts_nested_attributes_for :roles

  private
  def must_have_a_role
    errors.add(:roles, "user must have a role") unless roles.any?
  end
end

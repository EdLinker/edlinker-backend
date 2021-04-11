class User < ApplicationRecord
  authenticates_with_sorcery!
  rolify
  mount_uploader :avatar, AvatarUploader

  validates :role, presence: true
  enum role: %i(admin teacher student)

  belongs_to :group, optional: true
  has_many :auditoriums
  has_many :groups, through: :auditoriums
  has_many :messages, as: :author
  has_many :tasks

  accepts_nested_attributes_for :roles
end

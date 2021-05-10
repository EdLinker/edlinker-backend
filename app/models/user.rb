class User < ApplicationRecord
  authenticates_with_sorcery!
  rolify
  mount_uploader :avatar, AvatarUploader
  paginates_per 10

  validate  :must_have_a_role
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\d[0-9]\)*\z/, message: "Only positive number without spaces are allowed" }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "email invalid" }

  belongs_to  :group, optional: true
  has_one  :auditorium
  has_many :messages, as: :author
  has_many :messages
  has_many :tasks

  scope :telegram_users, -> { where.not(telegram_data: nil) }

  accepts_nested_attributes_for :roles

  def display_name
    "#{first_name} #{last_name}"
  end

  private
  def must_have_a_role
    errors.add(:roles, "user must have a role") unless roles.any?
  end
end

class Task < ApplicationRecord
  paginates_per 5

  has_many   :messages
  has_one    :user
  has_one    :auditorium
  belongs_to :subject

  validates  :title, presence: true
  validates  :number, presence: true

  STATUSES = %i[todo in_progress done].freeze
  enum status: STATUSES

  def change_status(status)
    update(status: status)
  end
end

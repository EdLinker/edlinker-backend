class Message < ApplicationRecord
  belongs_to :task
  belongs_to :author, polymorphic: true
  belongs_to :user
end

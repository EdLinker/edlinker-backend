class Auditorium < ApplicationRecord
  belongs_to :group
  belongs_to :teacher
  belongs_to :subject
end

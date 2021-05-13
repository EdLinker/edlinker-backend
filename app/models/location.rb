class Location < ApplicationRecord
  belongs_to :auditorium
  belongs_to :group
end

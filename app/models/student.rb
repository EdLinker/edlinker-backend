class Student < ApplicationRecord
  has_one :groups_student
  has_one :group
end

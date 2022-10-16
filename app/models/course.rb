class Course < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :serives
end

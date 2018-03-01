class Classroom < ApplicationRecord
  belongs_to :cohorts
  has_many :attendances
  has_many :users, through: :cohorts
end

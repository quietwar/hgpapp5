class Cohort < ApplicationRecord
  has_many :users
  belongs_to :staff_cohort
  alias_attribute :cohort, :classroom
end

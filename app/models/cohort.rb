class Cohort < ApplicationRecord
  has_many :users
  alias_attribute :cohort, :classroom
end

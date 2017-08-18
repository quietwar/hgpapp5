class Cohort < ApplicationRecord
  has_many :users
  belongs_to :admin
  alias_attribute :cohort, :classroom
end

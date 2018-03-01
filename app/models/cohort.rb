class Cohort < ApplicationRecord

  has_many :users
    accepts_nested_attributes_for :users, :allow_destroy => true
    validates_uniqueness :genius
  has_many  :classrooms
  has_many  :attendances, :through => :classrooms

end

class Cohort < ApplicationRecord

  has_many :users 
    accepts_nested_attributes_for :users, :allow_destroy => true
    validates_uniqueness :users
  #   after_save :genius
  # belongs_to :user, presence: true
  #   validates :user, presence: true
  #   alias_attribute :genius, :user
  # 
end

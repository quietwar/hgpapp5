class Cohort < ApplicationRecord

  validates :genius, presence: true
  validates :cohort, presence: true
  validates :city, presence: true
  validates :email, presence: true

  # validates :cell, presence: true
  # validates :stipend, presence: true
  # validates :benchmark, presence: true
  # validates :projects, presence: true

  has_many :user
  accepts_nested_attributes_for :user, :allow_destroy => true
  belongs_to :admin_user, required: false
  #alias_attribute :cohort, :classroom
end

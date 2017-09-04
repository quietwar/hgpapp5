class Cohort < ApplicationRecord

  has_many :users
  belongs_to :user, optional: true
  accepts_nested_attributes_for :user, :allow_destroy => true
  alias_attribute :genius, :user
  has_many :projects
  #validates :user, presence: true
  #validates :project, presence: true

  # validates :genius, presence: true
  # validates :cohort, presence: true
  # validates :city, presence: true
  # validates :email, presence: true

  # validates :cell, presence: true
  # validates :stipend, presence: true
  # validates :benchmark, presence: true
  # validates :projects, presence: true


  #alias_attribute :cohort, :classroom
end

class Cohort < ApplicationRecord

  has_many :users# :class_name => 'Cohort::Users'
    accepts_nested_attributes_for :users, :allow_destroy => true
    validates_uniqueness :users, attribute_name: 'genius'
    after_save :genius
  belongs_to :user, optional: true
  validates :user, presence: true
  alias_attribute :genius, :user
  #has_many :projects

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

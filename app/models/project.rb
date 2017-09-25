class Project < ApplicationRecord

  belongs_to :user, optional: true
  validates_uniqueness_of :full_name, scope: [:user_id]
  alias_attribute :genius, :user
  # belongs_to :cohort, optional: true
  validates_presence_of :user

  validates :app_name, presence: true
  validates :project_details, presence: true
  validates :start_date, presence: true
  validates :coding, presence: true
    #alias_attribute :app_details, :app
  #default_scope { where('start_date > ?', 90.days.ago)


end

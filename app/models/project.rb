class Project < ApplicationRecord

  belongs_to :user, optional: true
  #validates_uniqueness_of :full_name, scope: [:user_id]
  alias_attribute :genius, :user
  belongs_to :cohort, optional: true
  validates_presence_of :user
  validates_presence_of :cohort

  #alias_attribute :app_details, :app


  validates :app_name, presence: true
  validates :project_details, presence: true
  validates :start_date, presence: true
  validates :coding, presence: true

  default_scope { where('start_date > ?', 90.days.ago)
                  .order(start_date: :desc) }
end

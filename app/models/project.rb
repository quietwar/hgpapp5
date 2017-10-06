class Project < ApplicationRecord

  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :app_name, scope: [:user_id]
  alias_attribute :genius, :user


  validates :app_name, :project_details, :coding, presence: true

  #default_scope { where('start_date > ?', 90.days.ago)


end

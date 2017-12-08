class Project < ApplicationRecord

  belongs_to :user, inverse_of: :project
  validates_presence_of :user
  validates_uniqueness_of :app_name#, scope: [:user_id]
  alias_attribute :genius, :user


  validates :app_name, :project_details, :coding, :utf8, :_method, :authenticity_token, presence: false

  #default_scope { where('start_date > ?', 90.days.ago)


end

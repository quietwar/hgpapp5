class Project < ApplicationRecord

  belongs_to :user, inverse_of: :projects
  validates_presence_of :user
  validates_uniqueness_of :app_name
  alias_attribute :genius, :user


  validates :app_name, :project_details, :coding, :utf8, :_method, :authenticity_token, presence: false



end

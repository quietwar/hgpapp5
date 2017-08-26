class Project < ApplicationRecord
  belongs_to :user, required: false

  alias_attribute :app_details, :app


  validates :app_name, presence: true
  validates :project_details, presence: true
  validates :start_date, presence: true

  default_scope { where('start_date > ?', 90.days.ago)
                  .order(start_date: :desc) }
end

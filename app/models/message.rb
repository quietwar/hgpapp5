class Message < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :room, required: false

  default_scope { order(created_at: :desc).limit(20) }
end

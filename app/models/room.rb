class Room < ApplicationRecord
  belongs_to :user, required: true
  has_many :messages
end

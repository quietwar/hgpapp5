class Room < ApplicationRecord
  belongs_to :user, required: false
  has_many :messages
end

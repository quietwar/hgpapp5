class Room < ApplicationRecord
  belongs_to :user, inverse_of: :room
  validates_presence_of :user
  has_many :messages
end

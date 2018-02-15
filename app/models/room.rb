class Room < ApplicationRecord
  belongs_to :user, dependent: :destroy#, inverse_of: :room
  #validates_presence_of :user
  has_many :messages
end

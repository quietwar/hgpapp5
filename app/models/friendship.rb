class Friendship < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :friend, class_name: "User", required: false

  validates :user_id, presence: true
  validates :friend_id, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end

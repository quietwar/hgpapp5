class Friendship < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :friend, class_name: "User", required: false
end

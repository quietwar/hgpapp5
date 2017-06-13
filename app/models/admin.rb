class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }

         has_many :projects
         has_many :friendships
         has_many :friends, through: :friendships, class_name: "User"
         has_one :room
         has_many :cohorts
         has_many :features
         has_many :messages

    def full_name
           [first_name, last_name].join(" ")
    end

end

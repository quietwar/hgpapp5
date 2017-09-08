class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,:omniauthable,
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :first_name, presence: true
         validates :last_name, presence: true

         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         alias_attribute :Genius_Staff, :admin
         has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
         alias_method :comments, :active_admin_comments


         has_many :projects
         has_many :friendships
         has_many :friends, through: :friendships, class_name: "User"
         has_one :room
         has_many :cohorts
         has_many :classrooms
         has_many :features
         has_many :messages

end

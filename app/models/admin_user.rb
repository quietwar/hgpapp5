class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,:omniauthable,
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
         attr_accessor :login
         attr_accessor :username, :email, :password, :password_confirmation, :remember_me, :login

         validates :first_name, presence: true
         validates :last_name, presence: true

         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         alias_attribute :Genius_Staff, :admin
         has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
         alias_method :comments, :active_admin_comments


         has_many :cohort, :class_name => 'Admin_user::Cohort'
         has_many :users, :class_name => 'Admin_user::User'

         has_many :friendships
         has_many :friends#, through: :friendships, class_name: "User"
         has_one :room
         has_many :classrooms
         has_many :features
         has_many :messages

         def self.find_for_database_authentication(warden_conditions)
           conditions = warden_conditions.dup
           login = conditions.delete(:login)
           where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
         end

end

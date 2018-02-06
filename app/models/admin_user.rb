class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,:omniauthable,
  devise :database_authenticatable,:registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         attr_accessor :login
         attr_accessor :username, :email, :password, :password_confirmation, :remember_me, :login


   #with_options presence: true do
     validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
     validates :provider, presence: true
     validates :uid, uniqueness: { scope: :provider }
     validates :first_name, presence: true
     validates :last_name, presence: true
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



    # Devise override to ignore the password requirement if the user is authenticated
        def self.current_logged_user
          :current_admin_user
        end

        def password_required?
          return false if provider.present?
          super
        end

        class << self
          def from_omniauth(auth)
            admin_user = where(email: auth.info.email).first || where(auth.slice(:provider, :uid).to_h).first || new
            admin_user.tap { |this| this.update_attributes(provider: auth.provider, uid: auth.uid, email: auth.info.email) }
          end
        end

       def self.find_for_database_authentication(warden_conditions)
         conditions = warden_conditions.dup
         login = conditions.delete(:login)
         where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
       end
    end

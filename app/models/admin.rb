class Admin::ParameterSanitizer < Devise::ParameterSanitizer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         alias_attribute :staff, :admin

         has_many :projects
         has_many :friendships
         has_many :friends, through: :friendships, class_name: "User"
         has_one :room
         has_many :cohorts
         has_many :classrooms
         has_many :features
         has_many :messages

    def initialize(*)
       super
       permit(:sign_up, keys: [:username, :email])
    end

    def full_name
           [first_name, last_name].join(" ")
    end

end

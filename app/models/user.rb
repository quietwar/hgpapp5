class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :registerable,:database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
         # Only allow letter, number, underscore and punctuation.
          #validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
          validates :cohort_id, :city, presence: true
        #  validates :first_name, :last_name,:genius, uniqueness: true
          validates :email, presence: false
          validates :password, length: { minimum: 8 }
          validates :password_confirmation, length: { minimum: 8 }
          has_attached_file :avatar, styles: { medium: '680x300>', thumb: '170x75>' }, default_url: '/assests/images/missing.png"'
          validates_attachment_content_type :avatar, content_type: '/\Aimage\/.*\z/'
         after_create :create_chatroom



  has_one :cohort
    accepts_nested_attributes_for :cohort, :allow_destroy => true
  # belongs_to :cohort, optional: true
    validates_presence_of :cohort_id
  has_many :projects
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  has_one :room

  has_one :feature#, :class_name => 'User::Feature'
  has_many :messages
  has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
  alias_method :comments, :active_admin_comments
  #after_create :send_welcome_email!, :create_profile!


  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search_by_name(name)
    names_array = name.split(' ')

    if names_array.size == 1
      where('first_name LIKE ? or last_name LIKE ?',
        "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ?
        or last_name LIKE ?', "%#{names_array[0]}%",
        "%#{names_array[1]}%", "%#{names_array[0]}%",
        "%#{names_array[1]}%").order(:first_name)
    end
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end

  def current_friendship(friend)
    friendships.where(friend: friend).first
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.save!
    end
  end

    def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
        data = access_token.info
        user = User.where(:provider => access_token.provider, :uid =>     access_token.uid ).first

        unless user
          #registered_user = User.where(:email => access_token.info.email).first

          #if registered_user
          #  return registered_user
          #else
            user = User.create(
              name: data["genius"],
              provider:access_token.provider,
              email: data["email"],
              uid: access_token.uid ,
              password: Devise.friendly_token[0,20],
            )
          #end

       end

       user
    end

    # def create_profile!
    #     profile = profiles.create(
    #       name: 'name',
    #       kind: 'blog'
    #     )
    #
    #     create_user_main_profile(profile_id: profile.id)
    # end

    def send_welcome_email!
      UserMailer.delay.welcome(self.id)
    end

    def after_sign_up_path_for(user)
      '/root_path/'
    end

    def avatar_attributes=(attributes)
       # Marks the attachment for destruction on next save,
       # if the attributes hash contains a _destroy flag
       # and a new avatar was not uploaded at the same time:
       avatar.clear if has_destroy_flag?(attributes) && !avatar.dirty?
     end


  private


    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
    end

    def create_chatroom
     hyphenated_username = self.full_name.split.join('-')
     Room.create(name: hyphenated_username, user_id: self.id)
    end

    # def create_room
    #   @user = :current_user
    #   @room = @user.create_room(params[:room].permit(:genius, :username))
    #   hyphenated_username = self.full_name.split.join('-')
    #   room.create(name: hyphenated_username, user_id: self.id)
   #end
end

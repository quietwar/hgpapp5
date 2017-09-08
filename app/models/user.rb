class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable 
  devise :registerable,:database_authenticatable, :confirmable,:omniauthable,
         :recoverable, :rememberable, :trackable
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :genius, presence: false
         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         validates :cohort_id, presence: true
         validates :city, presence: true
         after_create :create_chatroom




  has_one :cohort
  belongs_to :cohort, optional: true
  accepts_nested_attributes_for :cohort, :allow_destroy => true
  has_many :projects, inverse_of: :user
  accepts_nested_attributes_for :projects, :allow_destroy => true
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  has_one :room

  has_one :feature
  has_many :messages
  has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
  alias_method :comments, :active_admin_comments


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

  def self.find_for_google_oauth2(auth)
    data = auth.info
    if validate_email(auth)
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.save
      return user
    else
      return nil
    end

  private

  protected

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
   end
end

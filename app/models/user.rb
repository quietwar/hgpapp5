class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         validates :cohort, presence: true
         validates :city, presence: true
         after_create :create_chatroom



   #has_one :cohort
  belongs_to :cohort, required: true
  has_many :projects, inverse_of: :user
  accepts_nested_attributes_for :projects, :allow_destroy => true
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  has_one :room

  has_one :feature
  has_many :messages
  has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
  alias_method :comments, :active_admin_comments



  #self.per_page = 20

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
    # end
end

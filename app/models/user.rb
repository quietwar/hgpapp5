class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         after_create :create_room
  alias_attribute :student, :genius

  has_many :projects
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  has_one :room
  has_one :cohort
  has_many :features
  has_many :messages



  #self.per_page = 20

  def full_name
    [first_name, last_name].join(" ")
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
    def create_room
      hyphenated_username = self.full_name.split.join('-')
      room.create(name: hyphenated_username, user_id: self.id)
    end
end
